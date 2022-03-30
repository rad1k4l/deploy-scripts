echo "load env.."
. env.sh
docker exec $CONTAINER_NAME /usr/sbin/nginx -t && docker exec $CONTAINER_NAME /usr/sbin/nginx -s reload
