# Our docker image start from Ubuntu 16.04 Xenial image
FROM ubuntu:16.04

# Install nginx
RUN apt-get update; apt-get install -y nginx
# Configure nginx
COPY nginx.conf /etc/nginx/nginx.conf
# Copy the HTML code in /home/www/www-data
COPY ./www-data /home/www/www-data

# Expose port 80
EXPOSE 80
# Run nginx
CMD ["nginx"]
