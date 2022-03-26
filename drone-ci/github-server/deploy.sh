echo "load env.."
. env.sh
bash ../../remove.sh "$CONTAINER_NAME"
docker run \
  --volume="$DATA_PATH":/data \
  --env=DRONE_GITHUB_CLIENT_ID="$GITHUB_CLIENT_ID" \
  --env=DRONE_GITHUB_CLIENT_SECRET="$GITHUB_CLIENT_SECRET" \
  --env=DRONE_RPC_SECRET="$RPC_SECRET" \
  --env=DRONE_SERVER_HOST="$SERVER_HOST" \
  --env=DRONE_SERVER_PROTO="$SERVER_PROTO" \
  --env=DRONE_DATABASE_DRIVER=postgres \
  --env=DRONE_DATABASE_DATASOURCE="$DATABASE_DATASOURCE"\
  --restart=unless-stopped \
  --detach=true \
  --name "$CONTAINER_NAME" \
  drone/drone:"$VERSION"
