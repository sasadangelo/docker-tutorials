# Your first Docker "Hello World!" application

This is your first Docker "Hello World" application. It is an Nginx web server that listens on 80 port and when you connect to it with your browser the "Hello World!" message will appear. For more details, read this [article](http://code4projects.altervista.org/getting-started-with-docker/).

## Run the demo

The following are the instructions to run the demo.

```
1. docker pull sasadangelo/hello-world
2. docker run --name hello-world -p 80:80 sasadangelo/hello-world
```

Open the browser and type "localhost" in the address bar. The "Hello World!" message will appear.

![Hello World](http://code4projects.altervista.org/wp-content/uploads/2018/06/DockerHelloWorld.jpg)

## Cleanup

The following are the instructions to cleanup your docker environment.

```
1. docker container rm -f hello-world
2. docker image rm -f sasadangelo/hello-world
```
