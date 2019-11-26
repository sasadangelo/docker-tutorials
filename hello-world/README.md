# Your first Docker "Hello World!" application

This tutorial shows how to create your first Docker "Hello World" application. The application is a Nginx web server that listens on 80 port and when you connect to it with your browser the "Hello World!" message will appear. For more details, read this [article](http://code4projects.altervista.org/getting-started-with-docker/).

## Run the demo

The following are the instructions to run the demo.

```
1. cd  <work_dir>
2. git clone https://github.com/sasadangelo/docker-tutorials
3. cd docker-tutorials/hello-world
4. ./build_image.sh
5. ./start_containers.sh
```

Open the browser and type "localhost" in the address bar. The "Hello World!" string will appear.

## Cleanup

You can cleanup the container and the image with the following commands.

```
1. ./stop_containers.sh
2. ./clean_image.sh
```
