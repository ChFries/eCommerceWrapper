SELECT
    COUNT(*)::decimal / EXTRACT(EPOCH FROM (MAX(last_update_am) - MIN(erstellt_am))) AS rows_per_second
FROM bestellung;