# Your first "Hello World!" Docker application

This tutorial shows how to create your first "Hello World" Docker application. The application is a Nginx web server that listen on 80 port and when you connect with to it with the browser the "Hello World!" string will appear. For more details, read this article [here](http://code4projects.altervista.org/getting-started-with-docker/). 

The following are the instructions to run it.

```
1. cd  <work_dir>
2. git clone https://github.com/sasadangelo/docker-tutorials
3. cd docker-tutorials/hello-world
4. ./build_image.sh
5. ./start_containers.sh
```

Open the browser and type "localhost" in the address bar. The "Hello World!" string will appear.
