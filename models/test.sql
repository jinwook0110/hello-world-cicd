-- select
-- *
-- from {{ source('demo', 'bike') }}
-- limit 10

WITH test_data AS (
    SELECT 
        COUNT(*) as row_count,
        COUNT(DISTINCT RIDE_ID) as unique_rides,
        MIN(STARTED_AT) as earliest_trip,
        MAX(STARTED_AT) as latest_trip
    FROM {{ ref('stg_bike') }}
)

SELECT 
    *
FROM test_data