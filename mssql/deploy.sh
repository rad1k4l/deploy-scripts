echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
    --name "$CONTAINER_NAME" \
    --port 1433:1433 \
    --env=MSSQL_SA_PASSWORD="$MSSQL_SA_PASSWORD" \
    --env=MSSQL_PID="$MSSQL_PID" \
    --env=ACCEPT_EULA="$ACCEPT_EULA" \
    --network="$NETWORK" \
    --volume "$DATA_PATH":/var/lib/mssql/data \
    --restart unless-stopped \
    mcr.microsoft.com/mssql/server:"$VERSION"
