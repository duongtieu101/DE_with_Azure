IF OBJECT_ID('dbo.fact_payments') IS NOT NULL
BEGIN
    DROP TABLE fact_payments
END

GO;

CREATE TABLE fact_payments
WITH
( 
	DISTRIBUTION = HASH(rider_id), 
	CLUSTERED COLUMNSTORE INDEX
)
AS
    SELECT
        SP.payment_id,
        CONVERT(DATETIME2, SP.date) AS "date",
        SP.amount,
        SP.rider_id        
    FROM staging_payments SP;
