#!/usr/bin/env bash

# script config params (likely to be relocated)
DB_USER_NAME=ptolemy
DB_PASSWORD=ptolemy
DATABASE_NAME=ptolemy

# create the database
# TODO: move variables to central location
# TODO: apply more secure password
# TODO: make the user creation not prompt for password
sudo -u postgres createuser -P $DB_USER_NAME
sudo -u postgres createdb -O $DB_USER_NAME $DATABASE_NAME

# add PostGIS support
sudo apt-get install -y postgis 
sudo apt-get install -y postgresql-9.3-postgis-2.1
sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;" $DATABASE_NAME

