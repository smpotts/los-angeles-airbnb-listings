```mermaid
erDiagram
  HOST {
        host_id bigint PK
        host_name varchar(64)
        host_since date
        host_response_time varchar(32)
        host_response_rate decimal
        host_is_superhost boolean
        created_at timestamp
        updated_at timestamp
  }
  HOST ||--o{ PROPERTY : has_many
  PROPERTY {
        property_id bigserial PK
        host_id bigint FK
        property_type varchar(64)
        room_type varchar(32)
        accommodates integer
        bathrooms integer
        beds integer
        neighborhood varchar(64)
        neighborhood_group varchar(64)
        latitude decimal
        longitude decimal
        created_at timestamp
        updated_at timestamp
  }
  PROPERTY ||--|| LISTING : has_one
  LISTING {
        listing_id bigint PK
        property_id bigserial FK
        listing_name varchar(64)
        price integer
        minimum_nights integer
        availability_365 integer
        number_of_reviews integer
        review_scores_rating decimal
        license varchar(64)
        created_at timestamp
        updated_at timestamp
  }

```