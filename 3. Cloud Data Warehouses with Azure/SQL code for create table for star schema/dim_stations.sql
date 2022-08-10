IF OBJECT_ID('dbo.dim_stations') IS NOT NULL
BEGIN
    DROP TABLE dim_stations
END

GO;

CREATE TABLE dim_stations
WITH
( 
	DISTRIBUTION = REPLICATE, 
	CLUSTERED COLUMNSTORE INDEX
)
AS
    SELECT
        SS.station_id,
        SS.name,
        SS.latitude,
        SS.longitude
    FROM staging_stations SS;