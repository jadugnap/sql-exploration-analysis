#! /bin/sh

## Install postgres and initdb ##

# brew install postgres
# initdb --locale=C -E UTF-8 $(brew --prefix)/var/postgres
# psql -l



## RUN THIS BEFORE .sql CREATED ##

# dropdb deforestation
# createdb deforestation
# psql -d deforestation -c '\dt'

# psql -d deforestation -c """
# DROP TABLE IF EXISTS forest_area;
# CREATE TABLE forest_area(
#     country_code VARCHAR(3),
#     country_name VARCHAR(255),
#     year INT,
#     forest_area_sqkm NUMERIC
# );"""

# psql -d deforestation -c """
# DROP TABLE IF EXISTS land_area;
# CREATE TABLE land_area(
#     country_code VARCHAR(3),
#     country_name VARCHAR(255),
#     year INT,
#     total_area_sqmi NUMERIC
# );"""

# psql -d deforestation -c """
# DROP TYPE IF EXISTS igroup;
# CREATE TYPE igroup AS ENUM ('NULL', 'High income', 'Upper middle income', 'Lower middle income', 'Low income');
# DROP TABLE IF EXISTS regions;
# CREATE TABLE regions(
#     country_name VARCHAR(255),
#     country_code VARCHAR(3),
#     region VARCHAR(255),
#     income_group igroup
# );"""

# psql -d deforestation -c "COPY forest_area FROM '$(pwd)/csv/forest_area.csv' DELIMITER ',' CSV HEADER;"
# psql -d deforestation -c "COPY land_area FROM '$(pwd)/csv/land_area.csv' DELIMITER ',' CSV HEADER;"
# psql -d deforestation -c "COPY regions FROM '$(pwd)/csv/regions.csv' DELIMITER ',' CSV HEADER;"

# pg_dump deforestation > deforestation.sql



## RUN THIS AFTER deforestation.sql CREATED ##

dropdb deforestation
createdb deforestation
psql -d deforestation -f deforestation.sql
