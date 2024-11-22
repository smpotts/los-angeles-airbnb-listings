INSERT INTO bi.host (
	SELECT DISTINCT
		host_id,
		host_name,
		min(host_since),
		min(host_response_time),
		host_response_rate,
		host_is_superhost
	FROM staging.listings_cleaned
	GROUP BY host_id,
		host_name,
		host_response_rate,
		host_is_superhost
);


INSERT INTO bi.property_listing (
	property_id,
    host_id,
	listing_name,
    property_type,
    room_type,
	license,
	neighborhood,
    neighborhood_group,
	latitude,
    longitude,
    accommodates,
    bathrooms,
    beds,
	price,
    minimum_nights,
    availability_365,
    number_of_reviews,
    review_scores_rating
)
SELECT
	id,
    host_id::bigint, -- explicitly cast to bigint
	name,
    property_type,
    room_type,
	license,
	neighbourhood_cleansed,
    neighbourhood_group_cleansed,
	latitude,
    longitude,
    accommodates,
    bathrooms,
    beds,
	price,
	minimum_nights,
	availability_365,
	number_of_reviews,
	review_scores_rating
FROM staging.listings_cleaned;
