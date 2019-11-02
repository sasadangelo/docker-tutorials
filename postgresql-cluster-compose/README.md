# PostgreSQL cluster with Docker Compose

This tutorial shows how to create a PostgreSQL cluster with Docker Compose.

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
3. cd docker-tutorials/postgresql-cluster-compose/docker-compose
4. docker-compose up -d
```

You can connect to PostgreSQL instances with one of the following commands.

```
psql -h localhost -p 5432 -U postgres
psql -h localhost -p 5433 -U postgres
psql -h localhost -p 5434 -U postgres
```
