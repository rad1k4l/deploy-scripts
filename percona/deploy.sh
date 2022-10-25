echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --name "$CONTAINER_NAME" \
  --env MYSQL_ROOT_PASSWORD="$ROOT_PASSWORD" \
  --network="$NETWORK" \
  --volume "$DATA_PATH":/var/lib/mysql \
  --volume "$CONFIG_PATH":/etc/mysql \
  --restart unless-stopped \
  percona/percona-server:"$VERSION"
chmod -R a+rwx "$SERVICE_PATH"