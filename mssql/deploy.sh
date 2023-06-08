echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"

docker run --detach \
    --name "$CONTAINER_NAME" \
    --env "ACCEPT_EULA=Y" \
    --env "MSSQL_SA_PASSWORD=$MSSQL_SA_PASSWORD" \
    --env "MSSQL_PID=$MSSQL_PID" \
    --network=$NETWORK \
    --publish $PUBLISH_PORT:1433 \
    --volume $DATA_PATH:/var/opt/mssql/data \
    --volume $LOG_PATH:/var/opt/mssql/log \
    --volume $SECRETS_PATH:/var/opt/mssql/secrets \
    --restart unless-stopped \
    mcr.microsoft.com/mssql/server:$VERSION
chmod -R a+rwx "$SERVICE_PATH"
