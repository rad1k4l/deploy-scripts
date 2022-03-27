echo "load env.."
. env.sh
bash ../../remove.sh "$CONTAINER_NAME"
docker run --detach \
  --restart unless-stopped \
  --network="$NETWORK" \
  --name "$CONTAINER_NAME" \
   registry:"$VERSION"
#-v /mnt/registry:/var/lib/registry \
