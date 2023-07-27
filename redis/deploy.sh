echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --name "$CONTAINER_NAME" \
  --env REDIS_PASSWORD="$REDIS_PASSWORD" \
  --network="$NETWORK" \
  --volume "$DATA_PATH":/data \
  --restart unless-stopped \
  redis:"$VERSION" \
redis-server --appendonly yes  --requirepass "$REDIS_PASSWORD"
