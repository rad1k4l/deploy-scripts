echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run -d \
  --name "$CONTAINER_NAME" \
  -e POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  -e POSTGRES_USER="$POSTGRES_USER" \
  --network="$NETWORK" \
  -v "$DATA_PATH":/var/lib/postgresql/data \
  --restart unless-stopped \
  postgres:"$VERSION"
