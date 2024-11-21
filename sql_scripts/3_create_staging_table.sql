CREATE TABLE staging.listings (
    id BIGINT PRIMARY KEY,
    name TEXT,
    host_id BIGINT,
    host_name TEXT,
    host_since TEXT,
    host_response_time TEXT,
    host_response_rate TEXT,
    host_is_superhost BOOLEAN,
    neighbourhood_cleansed TEXT,
    neighbourhood_group_cleansed TEXT,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    property_type TEXT,
    room_type TEXT,
    accommodates INT,
    bathrooms DECIMAL(3, 1),
    bedrooms INT,
    beds INT,
    price INT, 
    minimum_nights INT,
    availability_365 INT,
    number_of_reviews INT,
    review_scores_rating DECIMAL(3, 2),
    license TEXT,
    instant_bookable BOOLEAN
);

COPY staging.listings
FROM '/Users/spotts/Projects/los_angeles_airbnb_listings/listings.csv'
WITH(FORMAT CSV, HEADER);
