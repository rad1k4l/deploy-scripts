echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --name "$CONTAINER_NAME" \
  --env=POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  --env=POSTGRES_USER="$POSTGRES_USER" \
  --network="$NETWORK" \
  --volume "$DATA_PATH":/var/lib/postgresql/data \
  --restart unless-stopped \
  postgres:"$VERSION"
