FROM nginx:latest

# Set the working directory in the container
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y xz-utils

# Copy the nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf
# add tiles
COPY mapping_tiles.tar.xz /usr/src/app/mapping_tiles.tar.xz

RUN tar -xJf mapping_tiles.tar.xz

# Create a directory for the cache
RUN mkdir -p /var/cache/nginx && chown -R nginx:nginx /var/cache/nginx

# Expose port 80
EXPOSE 80 

# Set the working directory in the container to mapping_tiles
# When the command is run it will serve files from working directory
WORKDIR /usr/src/app/mapping_tiles

# Run the app when the container launches
CMD ["nginx", "-g", "daemon off;"]
