#!/usr/bin/env bash

/start.sh

locale-gen "en_US.UTF-8"
dpkg-reconfigure locales

sleep 30s

# load test data
su -c "hdfs dfs -put /sales.csv /tmp/sales.csv" impala
impala-shell -q "CREATE EXTERNAL TABLE sales (usergender string, usercity string, usersentiment int, zipcode string, sku string, createdat string, category string, price float, county string, countycode string, userstate string, categorygroup string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION '/tmp'"
impala-shell -q "SELECT * FROM sales"

# run as daemon
while true
do
	sleep 30
	echo "Impala is still up"
done
