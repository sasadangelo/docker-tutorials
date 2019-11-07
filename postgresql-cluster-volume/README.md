# PostgreSQL cluster - Make containers stateless with Docker volumes

This tutorial shows how to make the three PostgreSQL containers stateless using the Docker volumes.

## Prerequisites

Install the PostgreSQL client on your host system. I have a Mac and I used the following command to install it on my machine:

```
brew install libpq
```

Windows and Linux systems have an equivalent command you can search by google.

## Run the demo

The following are the instructions to run the demo.

```
1. cd  <work_dir>
2. git clone https://github.com/sasadangelo/docker-tutorials
3. cd docker-tutorials/postgresql-cluster-volume
4. ./build_image.sh
5. ./build_volumes.sh
5. ./start_containers.sh
```

You can connect to PostgreSQL instances with one of the following commands.

```
psql -h localhost -p 5432 -U postgres
psql -h localhost -p 5433 -U postgres
psql -h localhost -p 5434 -U postgres
```

## Cleanup

You can cleanup the containers and the image with the following commands.

```
1. ./stop_containers.sh
2. ./clean_image.sh
```

## The Upgrade scenario

Here the steps to upgrade a slave node (i.e. node2). We assume a new version of the Docker image is present on Docker HUB.

```
docker stop node2
docker pull sasadangelo/postgresql:latest
docker start node2
```

To migrate the master node (i.e. node1). You need to apply the failover scenario to switch the master from node1 to node2 or node3 and then apply the upgrade scenario steps to node1.

## The failover scenario

The failover scenario switches the master from node1 to node2 (or node3). The steps are the following.

1. stop all the exploiters (in the procedure below we don't have exploiters).
2. stop node1.
   ```
   docker stop node1
   docker container rm -f node1
   ```
3. promote node2 to master.
   ```
   docker exec -it node2 /bin/bash
   /usr/lib/postgresql/9.5/bin/pg_ctl promote -D /home/postgres/data/postgres/
   exit
   ```
4. make sure the other slave (node3) follow the new master
  a. stop node3
   ```
   docker stop node3
   docker container rm -f node3
   ```
  b. replicate the data directory from the new master
   ```
   docker run -it --name node3 --net net_private_cluster --ip 10.0.2.33 -p 5434:5432 -v volume3:/home/postgres/data --entrypoint "/bin/bash" postgresql
   rm -rf /home/postgres/data/postgres/*
   pg_basebackup -h node2 -p 5432 -U postgres -D /home/postgres/data/postgres/ -X stream -P
   ```
  c. configure recovery.conf
  d. create node3
  e. start node3
5. make sure the old master (node1) follow the new master
  a. stop node1
  b. configure recovery.conf
  c. replicate the data directory from the new master
  d. create node3
  e. start node3

Steps 5a, 5b, 5c, 5d and 5e are similar to 4a, 4b, 4c, 4d, and 4e.

## Test the failover

```
psql -h localhost -p 5433 -U postgres -d mydb
CREATE TABLE test(NAME TEXT);
\list
\dt
\q
psql -h localhost -p 5432 -U postgres -d mydb
\list
\dt
\q
psql -h localhost -p 5434 -U postgres -d mydb
\list
\dt
\q
```



