# PostgreSQL volumes
NODE1_VOLUME=volume1
NODE2_VOLUME=volume2
NODE3_VOLUME=volume3

# Create the three volumes for the data directory of each PostgreSQL node
docker volume create ${NODE1_VOLUME}
docker volume create ${NODE2_VOLUME}
docker volume create ${NODE3_VOLUME}
