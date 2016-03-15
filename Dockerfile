FROM rooneyp1976/impala

ADD start-data.sh /
ADD escaping.csv /

ENTRYPOINT ./start-data.sh
