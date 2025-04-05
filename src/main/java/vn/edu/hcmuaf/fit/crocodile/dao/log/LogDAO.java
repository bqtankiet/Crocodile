package vn.edu.hcmuaf.fit.crocodile.dao.log;

import vn.edu.hcmuaf.fit.crocodile.config.JdbiConnect;
import vn.edu.hcmuaf.fit.crocodile.config.database.CrocodileLogs;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

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

    @Override
    public List<Map<String, Object>> findOldAndNew(String tableName, int oldId, int newId) {
        String query = String.format("""
                        SELECT 'OLD' AS version, tb.*
                        FROM crocodile.%s tb
                        WHERE tb.id=%d
                        
                        UNION ALL
                        
                        SELECT 'NEW' AS version, tb.*
                        FROM crocodile.%s tb
                        WHERE tb.id=%d
                        """,
                tableName, oldId, tableName, newId);
        List<Map<String, Object>> result;
        result = JdbiConnect.getJdbi().withHandle(handle -> handle
                .createQuery(query)
                .mapToMap()
                .list()
        );
        return result;
    }

    @Override
    public LogEventDetail getLogDetailByEventId(int eventId) {
        String query = """
                SELECT
                    id,
                    event_id as eventId,
                    table_name as tableName,
                    old_id as oldId,
                    new_id as newId,
                    action
                FROM logging_event_detail
                WHERE event_id = :eventId""";
        return CrocodileLogs.getJdbiConnect().withHandle(handle -> handle
                .createQuery(query)
                .bind("eventId", eventId)
                .mapToBean(LogEventDetail.class)
                .findFirst()
                .orElse(null)
        );
    }
}
