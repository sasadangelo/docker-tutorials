# Docker Tutorials

This is a set of tutorials I created for my [Getting Started with Docker](http://code4projects.altervista.org/series/getting-started-with-docker/) series on [Code4Projects](http://code4projects.altervista.org) website. The goal of the series is to show you how I use Docker in my day by day job. To do that I created a set of tutorials that, step by step, show you how to create and deploy a complex application with Docker.

As example, I decided to show you how to create a PostgreSQL cluster starting from a simple "Hello World!" application to a whole PostgreSQL cluster.

The application you choose to learn Docker is not very important, what is really important is to understand the basic Docker concepts and how to apply them in real projects.

The following is a list of tutorials.

## 1) Hello World

In this tutorial, I will show you how to create a simple "Hello World!" application. We will create a container with a Web Server (Nginx) listeining on port 80. When the container will be up and running we can connect to it via browser and the "Hello World!" message will appear in it.

## 2) PostgreSQL

In this tutorial, I will show you how to create a container with a PostgreSQL instance running in it and listening on 5432 port.

## 3) PostgreSQL nodes in network

In this tutorial, I will show you how to create three containers with a PostgreSQL instance running in that communicate each other via TCP/IP. Once the container are up and running you can access to one of them with the command ```docker exec -it nodeX /bin/bash```, where X could be 1, 2, or 3, and ping the other nodes with the command ```ping nodeX```. This tutorial will be the starting point to create the PostgreSQL cluster in the next tutorial.

