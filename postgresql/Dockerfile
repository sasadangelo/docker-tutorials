# Download base image Ubuntu 16.04.
FROM ubuntu:16.04

# Update Ubuntu Software repository. This is required to install packages.
# Install the PostgreSQL package.
RUN apt-get update && apt-get install -y postgresql

# Create the folder for data directory
RUN mkdir -p /home/postgres/data && \
	chown -R postgres:staff /home/postgres/ && \
	chmod 700 /home/postgres/data

# Expose the PostgreSQL default port
EXPOSE 5432

# Use bash as extry point.
ENTRYPOINT /bin/bash
