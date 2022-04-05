echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run -d \
  --name "$CONTAINER_NAME" \
  -env MYSQL_ROOT_PASSWORD="$POSTGRES_PASSWORD" \
  --network="$NETWORK" \
  -volume "$DATA_PATH":/var/lib/mysql \
  -volume "$CONFIG_PATH":/etc/mysql \
  --restart unless-stopped \
  percona/percona-server:"$VERSION"
