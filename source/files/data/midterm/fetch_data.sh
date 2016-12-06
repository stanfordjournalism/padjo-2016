curl https://data.lacounty.gov/api/views/xutq-azb6/rows.csv?accessType=DOWNLOAD \
    | csvcut -C GEO_LOCATION \
    > lacs_shootings.csv


curl https://data.lacounty.gov/api/views/7jc3-gsk7/rows.csv?accessType=DOWNLOAD \
    | csvcut -C GEO_LOCATION \
    > lacs_deputies.csv

curl https://data.lacounty.gov/api/views/t8vk-5p9p/rows.csv?accessType=DOWNLOAD \
    | csvcut -C GEO_LOCATION \
    > lacs_people.csv

