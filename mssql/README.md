### --env=ACCEPT_EULA="$ACCEPT_EULA"
  - Set the ACCEPT_EULA variable to ‘Y’ to confirm your acceptance of the End-User Licensing Agreement.

### --env=MSSQL_SA_PASSWORD="$MSSQL_SA_PASSWORD"
  - Specify the strong password that is at least 8 characters and that meets the SQL Server’s password requirements.
  
### --env=MSSQL_PID="$MSSQL_PID"
  - Specify the edition or product key.

### --port 1433:1433 
  - Map a TCP port on the host environment (first value) with a TCP port in the container (second value).

### --volume "$DATA_PATH":/var/lib/mssql/data
  - Map the data folder on the container to a volume with the name mssqldata on the Docker host (optional; if you don’t use this option, all data will be lost if you delete the container)

### --name "$CONTAINER_NAME"
  - Specify a custom name for the container rather than a randomly generated one.

### --network="$NETWORK"
  - The container specifies which network the license will work on

### --restart unless-stopped
  - Similar to always, except that when the container is stopped (manually or otherwise), it is not restarted even after Docker daemon restarts. 

###  mcr.microsoft.com/mssql/server:"$VERSION"
  - MSSQ Server image version
