#! /bin/bash

cd /home/maposmatic/styles

git clone --quiet https://github.com/Nakaner/OpenRailwayMap-webmap-styles

cd OpenRailwayMap-webmap-styles

sudo -u maposmatic psql gis < sql/osm_carto_views.sql
sudo -u maposmatic psql gis < sql/get_station_importance.sql

carto -a $(mapnik-config -v) --quiet project.mml  > railmap.xml
php /vagrant/files/tools/postprocess-style.php railmap.xml

