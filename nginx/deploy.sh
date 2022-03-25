echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --name "$CONTAINER_NAME" \
  --publish 80:80 \
  --network="$NETWORK" \
  -v "$WEB_PATH":/usr/share/nginx/html \
  -v "$CONFIG_PATH":/etc/nginx \
  --restart unless-stopped \
  nginx:"$VERSION"

