IF OBJECT_ID('dbo.dim_datetimes') IS NOT NULL
BEGIN
    DROP TABLE dim_datetimes
END

GO;

DECLARE @StartDate DATETIME2
DECLARE @EndDate DATETIME2
SET @StartDate = (SELECT MIN(TRY_CONVERT(datetime, left(start_at, 19))) FROM staging_trips)
SET @EndDate = DATEADD(year, 5, (SELECT MAX(TRY_CONVERT(datetime, left(start_at, 19))) FROM staging_trips))


CREATE TABLE dim_datetimes (
    "datetime" DATETIME2,
    "hour" int,
    "day" int,
    "week" int,
    "weekday" int,
    "month" int,
    "quarter" int,
    "year" int
)
WHILE @StartDate <= @EndDate
      BEGIN
             INSERT INTO [dim_datetimes]
             SELECT
                   @StartDate,
                   DATEPART(HOUR, @StartDate),
                   DATEPART(WEEKDAY, @StartDate),
                   DATEPART(DAY, @StartDate),
                   DATEPART(WEEK, @StartDate),
                   DATEPART(QUARTER, @StartDate),
                   DATEPART(MONTH, @StartDate),
                   DATEPART(YEAR, @StartDate)

             SET @StartDate = DATEADD(hh, 1, @StartDate)
      END;