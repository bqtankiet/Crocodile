package vn.edu.hcmuaf.fit.crocodile.dao.log;

import vn.edu.hcmuaf.fit.crocodile.config.database.CrocodileLogs;

import java.time.LocalDateTime;
import java.util.List;

public class LogDAO implements ILogDAO {
    @Override
    public List<LogEvent> reportLogEvents() {
        String sql = """
                    SELECT
                        le.event_id AS eventId,
                        le.level_string AS `level`,
                        FROM_UNIXTIME(le.timestmp / 1000) AS `timestamp`,
                        MAX(CASE WHEN lep.mapped_key = 'category' THEN lep.mapped_value END) AS category,
                        MAX(CASE WHEN lep.mapped_key = 'value1' THEN lep.mapped_value END) AS userId,
                        MAX(CASE WHEN lep.mapped_key = 'value2' THEN lep.mapped_value END) AS username,
                        MAX(CASE WHEN lep.mapped_key = 'value3' THEN lep.mapped_value END) AS ip,
                        le.formatted_message AS message
                    FROM logging_event le
                    JOIN logging_event_property lep ON le.event_id = lep.event_id
                    GROUP BY le.event_id
                    ORDER BY `timestamp` DESC
                """;

        return CrocodileLogs.getJdbiConnect().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(LogEvent.class)
                        .list()
        );
    }

    @Override
    public int getLastLogEventId() {
        return CrocodileLogs.getJdbiConnect().withHandle(handle -> handle
                .createQuery("SELECT MAX(event_id) FROM logging_event")
                .mapTo(Integer.class)
                .findFirst().orElseThrow()
        );
    }

    @Override
    public void logDetail(int lastEventId, String table, int oldId, int newId, String action) {
        String query = """
                INSERT INTO logging_event_detail (event_id, table_name, old_id, new_id, action)
                VALUES (:eventId, :tableName, :oldId, :newId, :action);
                """;
        CrocodileLogs.getJdbiConnect().withHandle(handle -> handle
                .createUpdate(query)
                .bind("eventId", lastEventId)
                .bind("tableName", table)
                .bind("oldId", oldId)
                .bind("newId", newId)
                .bind("action", action)
                .execute()
        );
    }
}
