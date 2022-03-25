echo "Container name: $1"
CNAME=$1
if [ "$(docker ps -qa -f name=$CNAME)" ]; then
  echo ":: Found container - $CNAME"
  if [ "$(docker ps -q -f name=$CNAME)" ]; then
    echo ":: Stopping running container - $CNAME"
    docker stop "$CNAME"
  fi
  echo ":: Removing stopped container - $CNAME"
  docker rm "$CNAME"
fi
