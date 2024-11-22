DROP TABLE IF EXISTS bi.host;
CREATE TABLE bi.host (
	host_id bigint NOT NULL,
    host_name varchar(64),
    host_since date,
    host_response_time varchar(32),
    host_response_rate decimal(3,2),
    host_is_superhost boolean,
    created_at timestamp DEFAULT NOW(),
    updated_at timestamp DEFAULT NOW(),
	CONSTRAINT hosts_pkey PRIMARY KEY (host_id)
);

DROP TABLE IF EXISTS bi.property_listing;
CREATE TABLE bi.property_listing (
    property_id bigint NOT NULL,
    host_id bigint NOT NULL,
    listing_name varchar(256),
    property_type varchar(64),
    room_type varchar(32),
    license varchar(128),
    neighborhood varchar(64),
    neighborhood_group varchar(64),
    latitude decimal(9,6),
    longitude decimal(9,6),
    accommodates integer,
    bathrooms integer,
    beds integer,
    price integer,
    minimum_nights integer,
    availability_365 integer,
    number_of_reviews integer,
    review_scores_rating decimal(3,2),
    created_at timestamp DEFAULT NOW(),
    updated_at timestamp DEFAULT NOW(),
	CONSTRAINT property_pkey PRIMARY KEY (property_id),
	CONSTRAINT property_fkey_host_id FOREIGN KEY (host_id) REFERENCES bi.host (host_id)
);

