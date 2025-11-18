#Client TLS
redis-cli --tls --cacert /etc/redis/tls/ca.crt --cert /etc/redis/tls/server.crt --key /etc/redis/tls/server.key -h redis1 -p 6379 -a S3cureClientPass PING
#Sentinel status
redis-cli --tls --cacert /etc/redis/tls/ca.crt --cert /etc/redis/tls/server.crt --key /etc/redis/tls/server.key -h redis1 -p 26379 SENTINEL master mymaster
