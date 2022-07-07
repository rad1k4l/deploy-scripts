echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
    --name "$CONTAINER_NAME" \
    --publish 3000:3000 \
    --env= "$Node_ENV" \
    --env="$APP" \
    --network="$NETWORK" \
    --volume "$WEB_PATH":/var/www/example.com/api \
    node:"$VERSION"