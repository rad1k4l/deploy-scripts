echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run -d \
  --name "$CONTAINER_NAME" \
  -e MYSQL_ROOT_PASSWORD="$POSTGRES_PASSWORD" \
  --network="$NETWORK" \
  -v "$DATA_PATH":/var/lib/mysql \
  -v "$CONFIG_PATH":/etc/mysql \
  --restart unless-stopped \
  percona/percona-server:"$VERSION"
