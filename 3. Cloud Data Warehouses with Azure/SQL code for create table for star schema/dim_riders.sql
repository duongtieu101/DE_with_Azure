IF OBJECT_ID('dbo.dim_riders') IS NOT NULL
BEGIN
    DROP TABLE dim_riders
END

GO;

CREATE TABLE dim_riders
WITH
( 
	DISTRIBUTION = REPLICATE, 
	CLUSTERED COLUMNSTORE INDEX
)
AS
    SELECT
        SR.rider_id,
        SR.first_name,
        SR.last_name,
        SR.address,
        CONVERT(DATE, SR.birthday) AS birthday,
        CONVERT(DATE, SR.account_start_date) AS account_start_date,
        CONVERT(DATE, SR.account_end_date) AS account_end_date,
        SR.is_member
    FROM staging_riders SR;