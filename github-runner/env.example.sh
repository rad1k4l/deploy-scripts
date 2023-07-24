# Additional variable to differentiate the runner type
RUNNER_TYPE="prod"

# Main variables to runner
RUNNER_TOKEN="ASOQCNTOKENTOKENSOQCN"
RUNNER_GROUP="Default"
LABELS="$RUNNER_TYPE"
RUNNER_SCOPE="org"
ORG_NAME="github-organization-name"
RUNNER_NAME="$ORG_NAME-$RUNNER_TYPE-runner"
CONTAINER_NAME="$RUNNER_NAME"
VERSION="2.306.0-ubuntu-focal"
