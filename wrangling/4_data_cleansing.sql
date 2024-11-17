-- create a copy of the source data to clean
DROP TABLE IF EXISTS staging.listings_cleaned;
CREATE TABLE staging.listings_cleaned AS 
	SELECT * FROM staging.listings;

SELECT *
FROM staging.listings_cleaned
-- where host_since like '4%'
LIMIT 100;

-- set 'N/A' values to NULL
UPDATE staging.listings_cleaned
SET host_response_time = NULL
WHERE host_response_time = 'N/A';

UPDATE staging.listings_cleaned
SET host_response_rate = NULL
WHERE host_response_rate = 'N/A';

-- update the host_since dates where they are Excel data serial numbers
UPDATE staging.listings_cleaned
SET host_since =
    CASE WHEN host_since ~ '^\d+$' AND (host_since::integer >= 1 AND host_since::integer <= 50000) THEN 
            TO_CHAR(
                TO_DATE((host_since::integer - 25569)::text, 'YYYY-MM-DD'),  -- Convert adjusted number to date
                'YYYY/MM/DD'  -- Format the date as YYYY/MM/DD
            )		
		ELSE host_since
	END;

UPDATE staging.listings_cleaned
SET host_since = TO_DATE(host_since, 'DD/MM/YY')
WHERE host_since ~ '^\d{2}/\d{2}/\d{2}$'; 

ALTER TABLE staging.listings_cleaned 
    ALTER COLUMN host_since SET DATA TYPE DATE 
    USING host_since::date;

-- changing the data type of the host response rate
ALTER TABLE staging.listings_cleaned 
	ALTER COLUMN host_response_rate SET DATA TYPE DECIMAL(3,2) USING host_response_rate::numeric(3,2);
	
