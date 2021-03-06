# PostgreSQL node names
NODE1_NAME=node1
NODE2_NAME=node2
NODE3_NAME=node3

MASTER_NAME=${NODE1_NAME}

NODE1_PORT=5432
NODE2_PORT=5433
NODE3_PORT=5434

# PostgreSQL volumes
NODE1_VOLUME=volume1
NODE2_VOLUME=volume2
NODE3_VOLUME=volume3

# Nodes private ips
NODE1_PRIVATE_IP=10.0.2.31
NODE2_PRIVATE_IP=10.0.2.32
NODE3_PRIVATE_IP=10.0.2.33

# Nodes private network name
PRIVATE_NETWORK_NAME=node_private_bridge

docker volume inspect ${NODE1_VOLUME} > /dev/null
if [ $? -ne 0 ]
then
    echo "ERROR: ${NODE1_VOLUME} doesn't exist. Run the script "./build_volumes" first."
    exit 1
fi

docker volume inspect ${NODE2_VOLUME} > /dev/null
if [ $? -ne 0 ]
then
    echo "ERROR: ${NODE2_VOLUME} doesn't exist. Run the script "./build_volumes" first."
    exit 1
fi

docker volume inspect ${NODE1_VOLUME} > /dev/null
if [ $? -ne 0 ]
then
    echo "ERROR: ${NODE1_VOLUME} doesn't exist. Run the script "./build_volumes" first."
    exit 1
fi

# Create a private network
docker network create -d bridge --gateway=10.0.2.1 --subnet=10.0.2.1/24 ${PRIVATE_NETWORK_NAME}

# Create the PostgreSQL containers and start them
docker create -it --net ${PRIVATE_NETWORK_NAME} --ip ${NODE1_PRIVATE_IP} --hostname ${NODE1_NAME} --name ${NODE1_NAME} --env NODE_NAME=${NODE1_NAME} --env MASTER_NAME=${MASTER_NAME} -p ${NODE1_PORT}:5432 -v ${NODE1_VOLUME}:/home/postgres/data postgresql /bin/bash
docker create -it --net ${PRIVATE_NETWORK_NAME} --ip ${NODE2_PRIVATE_IP} --hostname ${NODE2_NAME} --name ${NODE2_NAME} --env NODE_NAME=${NODE2_NAME} --env MASTER_NAME=${MASTER_NAME} -p ${NODE2_PORT}:5432 -v ${NODE2_VOLUME}:/home/postgres/data postgresql /bin/bash
docker create -it --net ${PRIVATE_NETWORK_NAME} --ip ${NODE3_PRIVATE_IP} --hostname ${NODE3_NAME} --name ${NODE3_NAME} --env NODE_NAME=${NODE3_NAME} --env MASTER_NAME=${MASTER_NAME} -p ${NODE3_PORT}:5432 -v ${NODE3_VOLUME}:/home/postgres/data postgresql /bin/bash
docker start ${NODE1_NAME}
docker start ${NODE2_NAME}
docker start ${NODE3_NAME}
