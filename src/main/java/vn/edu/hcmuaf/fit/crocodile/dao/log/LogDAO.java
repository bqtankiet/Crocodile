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
}
