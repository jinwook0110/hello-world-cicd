WITH CTE AS (
    SELECT DISTINCT
        STARTED_AT,
        DATE(STARTED_AT) AS date_key,
        HOUR(STARTED_AT) AS hour_num,
       
        {{day_type('STARTED_AT')}} AS DAY_TYPE,
        
        {{get_season('STARTED_AT')}} AS STATION_OF_YEAR

    FROM
        {{ source('demo', 'bike') }}
    WHERE STARTED_AT IS NOT NULL
)

SELECT 
    *
FROM CTE
ORDER BY date_key
