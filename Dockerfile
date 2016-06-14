#
# Build: docker build -t bodom0015/sb-admin-bs4-ui .
#

# This image will be based on the official nodejs docker image
#FROM node:latest
FROM ubuntu:wily

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    apt-get install -y nodejs

# Copy in the source
COPY . /home/
 
# Set directory for npm/bower
WORKDIR /home

# Install dependencies
RUN npm install -g ts-node && \
    npm install

# Tell Docker we plan to use this port (http-server's default)
EXPOSE 8080

# The command to run our app when the container is run
CMD [ "npm", "start" ]
