FROM rooneyp1976/impala

ADD start-data.sh /
ADD sales.csv /

ENTRYPOINT ./start-data.sh
