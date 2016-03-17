#!/usr/bin/env bash

/start.sh

sleep 30s

# load test data
su -c "hdfs dfs -put /sales.csv /tmp/sales.csv" impala
impala-shell -q "CREATE EXTERNAL TABLE sales (usergender varchar(255), usercity varchar(255), usersentiment int, zipcode varchar(255), sku varchar(255), createdat varchar(255), category varchar(255), price float, county varchar(255), countycode varchar(255), userstate varchar(255), categorygroup varchar(255)) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION '/tmp'"

# run as daemon
while true
do
	sleep 30
	echo "Impala is still up"
done
