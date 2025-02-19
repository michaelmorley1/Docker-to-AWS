# Use the Ubuntu 22.04 base image
FROM ubuntu:22.04

# Update the package list
RUN apt-get update

# Install Nginx, unzip, and curl
RUN apt-get install -y nginx unzip curl


# Set the working directory to the default web directory for Nginx
WORKDIR /var/www/html

# Download the master.zip file from the specified GitHub repository
RUN curl -o master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master

# Unzip the downloaded master.zip file
RUN unzip master.zip

# Move the contents of the 2048-master directory to the current directory (WORKDIR)
RUN mv 2048-master/* .

# Clean up by removing the now empty 2048-master directory and the master.zip file
RUN rm -rf 2048-master master.zip

# Verify that the files are moved correctly (for debugging)
RUN ls -la /var/www/html

# Expose port 80 to allow traffic to the web server
EXPOSE 80

# Start Nginx using the default configuration file
CMD ["nginx", "-g" , "daemon off;"]
