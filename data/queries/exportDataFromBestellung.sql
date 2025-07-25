SELECT
    *,
    EXTRACT(EPOCH FROM erstellt_am) * 1000 AS erstellt_am_ms,
    EXTRACT(EPOCH FROM last_update_am) * 1000 AS last_updated_am_ms,
    EXTRACT(EPOCH FROM (last_update_am - erstellt_am)* 1000) AS latency
FROM bestellung;