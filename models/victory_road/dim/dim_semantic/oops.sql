SELECT
  DATE_TRUNC('day', created_at) AS metric_time__day
  , AVG(price) AS price_avg
FROM ANALYTICS.dbt_echavez.dim_listings_w_host listings_with_host_src_10000
GROUP BY
  DATE_TRUNC('day', created_at)
