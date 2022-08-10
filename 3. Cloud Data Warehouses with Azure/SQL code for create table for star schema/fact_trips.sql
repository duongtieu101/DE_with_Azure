IF OBJECT_ID('dbo.fact_trips') IS NOT NULL
BEGIN
    DROP TABLE fact_trips
END

GO;

CREATE TABLE fact_trips
WITH
( 
	DISTRIBUTION = HASH(rider_id), 
	CLUSTERED COLUMNSTORE INDEX
)
AS
    SELECT
        ST.trip_id,
        ST.rider_id,
        ST.rideable_type,
        ST.start_station_id,
        ST.end_station_id,
        CONVERT(DATETIME2, ST.start_at) AS start_at,
        CONVERT(DATETIME2, ST.ended_at) AS ended_at,
        DATEDIFF(minute, start_at, ended_at) AS "trip_duration (minute)",
        CASE
            WHEN SR.account_end_date IS NOT NULL THEN DATEDIFF(day, SR.birthday, SR.account_end_date)
            ELSE DATEDIFF(day, SR.birthday, GETDATE())
        END AS "account_age (day)"
    FROM staging_trips ST
    LEFT JOIN staging_riders SR
        ON ST.rider_id = SR.rider_id;