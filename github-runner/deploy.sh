echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"

docker run -d --restart always --name $CONTAINER_NAME \
  -e RUNNER_TOKEN="$RUNNER_TOKEN" \
  -e RUNNER_NAME="$RUNNER_NAME" \
  -e RUNNER_WORKDIR="/tmp/runner/$CONTAINER_NAME" \
  -e RUNNER_GROUP="$RUNNER_GROUP" \
  -e LABELS="$LABELS" \
  -e DISABLE_AUTO_UPDATE="true" \
  -e RUNNER_SCOPE="$RUNNER_SCOPE" \
  -e ORG_NAME="$ORG_NAME" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /tmp/runner/$CONTAINER_NAME:/tmp/runner/$CONTAINER_NAME \
myoung34/github-runner:"$VERSION"
