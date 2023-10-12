#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

if [[ -z "$CONTAINER_NAME" || -z "$VERSION" || -z "$NETWORK" || -z "$GO_PATH" || -z "$GO_ENV" || -z "$APP" ]]; then
    echo "Error: Required environment variables are not set."
    exit 1
fi

echo "Removing container if it exists..."
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

echo "Building Go application..."
cd "$GO_PATH"
go build -o golang-app "$APP"

echo "Running the Docker container named $CONTAINER_NAME..."
docker run --detach \
  --name "$CONTAINER_NAME" \
  --publish 8081:8080 \
  --network="$NETWORK" \
  --restart unless-stopped \
  --volume "$GO_PATH":/usr/src/golang-app \
  --env GO_ENV="$GO_ENV" \
  --workdir /usr/src/golang-app \
  "$CONTAINER_NAME":"$VERSION"

echo "Script execution complete."
