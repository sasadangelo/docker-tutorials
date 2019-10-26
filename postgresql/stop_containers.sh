# PostgreSQL node name
NODE1_NAME=node1
# Stop the node and drop it
docker stop ${NODE1_NAME}
docker rm ${NODE1_NAME}
