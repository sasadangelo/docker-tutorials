# PostgreSQL node name
NODE_NAME=node

# Create the PostgreSQL container and start it
docker create --name ${NODE_NAME} -p 80:80 sasadangelo/hello-world
docker start ${NODE_NAME}
