echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --name "$CONTAINER_NAME" \
  --publish 80:80 \
  --network="$NETWORK" \
  -volume "$WEB_PATH":/usr/share/nginx/html \
  -volume "$CONFIG_PATH":/etc/nginx/conf.d \
  --restart unless-stopped \
  nginx:"$VERSION"

