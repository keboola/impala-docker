#!/usr/bin/env bash

# start
/start.sh

# load test data
su -c "hdfs dfs -put /escaping.csv /tmp/escaping.csv" impala
impala-shell -q "CREATE EXTERNAL TABLE escaping (col1 VARCHAR(255), col2 VARCHAR(255)) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION '/tmp'"
impala-shell -q "SELECT * FROM escaping"

# run as daemonexit
while true
do
	sleep 30
	echo "Impala is still up"
done
