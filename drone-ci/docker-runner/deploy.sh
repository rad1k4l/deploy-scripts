echo "load env.."
. env.sh
bash ../../remove.sh "$CONTAINER_NAME"
docker run --detach \
  --volume="$DOCKER_SOCKET":/var/run/docker.sock \
  --env=DRONE_RPC_PROTO="$SERVER_PROTO" \
  --env=DRONE_RPC_HOST="$SERVER_HOST" \
  --env=DRONE_RPC_SECRET="$RPC_SECRET" \
  --env=DRONE_RUNNER_CAPACITY=2 \
  --env=DRONE_RUNNER_NETWORKS="$NETWORK" \
  --env=DRONE_RUNNER_NAME="main-ovh-runner" \
  --restart unless-stopped \
  --network="$NETWORK" \
  --name "$CONTAINER_NAME" \
  drone/drone-runner-docker:"$VERSION"
