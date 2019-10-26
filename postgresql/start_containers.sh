# PostgreSQL node name
NODE1_NAME=node1

NODE1_PORT=5432
# Create the PostgreSQL container and start it
docker create -it --name ${NODE1_NAME} --p ${NODE1_PORT}:5432 postgresql /bin/bash
docker start ${NODE1_NAME}
