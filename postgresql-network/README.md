# PostgreSQL nodes in network

This tutorial shows how to create three containers with PostgreSQL application running in them. The containers will be connected to each other via TCP/IP.

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
3. cd docker-tutorials/postgresql-network
4. ./build_image.sh
5. ./start_containers.sh
```

You can access to a node (i.e. node1) and ping another node (i.e. node2).

```
1. docker exec -it node1 /bin/bash
2. ping node2
```

## Cleanup

You can cleanup the containers and the image with the following commands.

```
1. ./stop_containers.sh
2. ./clean_image.sh
```
