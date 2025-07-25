SELECT
    ROUND(AVG(runtime_ms)) AS avg_runtime_ms,
    ROUND(PERCENTILE_CONT(0.05) WITHIN GROUP (ORDER BY runtime_ms)) AS p5,
    ROUND(PERCENTILE_CONT(0.10) WITHIN GROUP (ORDER BY runtime_ms)) AS p10,
    ROUND(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY runtime_ms)) AS p25,
    ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY runtime_ms)) AS median,
    ROUND(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY runtime_ms)) AS p75,
    ROUND(PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY runtime_ms)) AS p90,
    ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY runtime_ms)) AS p95
FROM (
         SELECT
             (EXTRACT(EPOCH FROM last_update_am) - EXTRACT(EPOCH FROM erstellt_am)) * 1000 AS runtime_ms
         FROM bestellung
         WHERE last_update_am IS NOT NULL AND erstellt_am IS NOT NULL
     ) AS runtimes;