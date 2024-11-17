# Needs Cleaning List
## Overview
This is the list of things that need to be done to the data to clean it up and make it more consistent for analysis. The source data is pretty clean, so there aren't too many things to do to clean it up, but still a few things that need to be transformed.

## To Do List
- change `host_since` to a proper date field
- `host_since` has a bunch of values that are in the 40,000 range
    - these are Excel data serial numbers and need to be converted to dates
- convert "N/A" values in `host_response_time` to nulls
- convert "N/A" values in `host_response_rate` to nulls
- `host_response_rate` should be a decimal
