WITH BIKE AS (
    SELECT 
    DISTINCT
        start_station_id AS station_id,
        start_station_name AS station_name,
        start_lat AS station_lat,
        start_lng AS station_lng
    FROM {{ source('demo', 'bike') }}
    WHERE RIDE_ID != '"bikeid"'
    LIMIT 10
)

SELECT
    *
FROM BIKE