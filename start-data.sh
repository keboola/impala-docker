#!/usr/bin/env bash

# start
/start.sh

# load test data
mkdir -p /sample_data/escaping
hdfs dfs -put escaping.csv /sample_data/escaping
impala-shell -q "CREATE EXTERNAL TABLE escaping (col1 VARCHAR(255), col2 VARCHAR(255)) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION '/sample_data/escaping'"

# run as daemon
while true
do
	sleep 30
	echo "Impala is still up"
done
