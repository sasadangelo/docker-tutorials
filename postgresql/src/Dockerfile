# Download base image Ubuntu 16.04.
FROM ubuntu:16.04

# Update Ubuntu Software repository. This is required to install packages.
# Install the PostgreSQL package.
RUN apt-get update && apt-get install -y postgresql

# Create the folder for data directory
RUN mkdir -p /home/postgres/data && \
	mkdir -p /home/postgres/logs && \
	mkdir -p /usr/local/bin/cluster/postgresql && \
	chown -R postgres:staff /home/postgres/ && \
	chmod 700 /home/postgres/data

# Switch to postgresql user
USER postgres

# Create the PostgreSQL data directory
RUN /usr/lib/postgresql/9.5/bin/initdb -D /home/postgres/data

# Copy deploy scripts in /usr/local/bin/cluster container folder.
COPY ./postgresql /usr/local/bin/cluster/postgresql
	
# Expose the PostgreSQL default port
EXPOSE 5432

# Use bash as extry point.
ENTRYPOINT /usr/local/bin/cluster/postgresql/entrypoint.sh
