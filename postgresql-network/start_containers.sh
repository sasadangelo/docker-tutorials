# PostgreSQL node names
NODE1_NAME=node1
NODE2_NAME=node2
NODE3_NAME=node3

# Nodes private ips
NODE1_PRIVATE_IP=10.0.2.31
NODE2_PRIVATE_IP=10.0.2.32
NODE3_PRIVATE_IP=10.0.2.33

# Nodes private network name
PRIVATE_NETWORK_NAME=node_private_bridge

# Create a private network
docker network create -d bridge --gateway=10.0.2.1 --subnet=10.0.2.1/24 ${PRIVATE_NETWORK_NAME}

docker create -it --net ${PRIVATE_NETWORK_NAME} --ip ${NODE1_PRIVATE_IP} --hostname ${NODE1_NAME} --name ${NODE1_NAME} postgresql /bin/bash
docker create -it --net ${PRIVATE_NETWORK_NAME} --ip ${NODE2_PRIVATE_IP} --hostname ${NODE2_NAME} --name ${NODE2_NAME} postgresql /bin/bash
docker create -it --net ${PRIVATE_NETWORK_NAME} --ip ${NODE3_PRIVATE_IP} --hostname ${NODE3_NAME} --name ${NODE3_NAME} postgresql /bin/bash
docker start ${NODE1_NAME}
docker start ${NODE2_NAME}
docker start ${NODE3_NAME}
