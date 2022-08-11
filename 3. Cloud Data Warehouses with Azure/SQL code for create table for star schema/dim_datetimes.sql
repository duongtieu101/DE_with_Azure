IF OBJECT_ID('dbo.dim_datetimes') IS NOT NULL
BEGIN
    DROP TABLE dim_datetimes
END

GO;

CREATE TABLE dim_datetimes
WITH
( 
	DISTRIBUTION = HASH("datetime"), 
	CLUSTERED COLUMNSTORE INDEX
)
AS

SELECT 
    CONVERT(DATETIME2, ST.start_at) AS "datetime",
    DATEPART(hour, CONVERT(DATETIME2, ST.start_at)) AS "hour",
    DATEPART(day, CONVERT(DATETIME2, ST.start_at)) AS "day",
    DATEPART(week, CONVERT(DATETIME2, ST.start_at)) AS "week",
    DATEPART(weekday, CONVERT(DATETIME2, ST.start_at)) AS "weekday",
    DATEPART(month, CONVERT(DATETIME2, ST.start_at)) AS "month",
    DATEPART(quarter, CONVERT(DATETIME2, ST.start_at)) AS "quarter",
    DATEPART(year, CONVERT(DATETIME2, ST.start_at)) AS "year"
    FROM staging_trips ST
UNION
SELECT 
    CONVERT(DATETIME2, SP.date) AS "datetime",
    DATEPART(hour, CONVERT(DATETIME2, SP.date)) AS "hour",
    DATEPART(day, CONVERT(DATETIME2, SP.date)) AS "day",
    DATEPART(week, CONVERT(DATETIME2, SP.date)) AS "week",
    DATEPART(weekday, CONVERT(DATETIME2, SP.date)) AS "weekday",
    DATEPART(month, CONVERT(DATETIME2, SP.date)) AS "month",
    DATEPART(quarter, CONVERT(DATETIME2, SP.date)) AS "quarter",
    DATEPART(year, CONVERT(DATETIME2, SP.date)) AS "year"
    FROM staging_payments SP;
