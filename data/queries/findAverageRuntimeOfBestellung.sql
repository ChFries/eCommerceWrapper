SELECT
    AVG(EXTRACT(EPOCH FROM (last_update_am - erstellt_am)) * 1000) AS avg_duration_ms
FROM
    bestellung;