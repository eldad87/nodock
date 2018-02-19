FROM phusion/baseimage:0.9.19

RUN apt-get update &&\
    apt-get install -y npm &&\
    npm install -g n

ARG NODE_ENV=production
ARG NODE_VERSION=latest
ARG PROJECT_PATH=/opt/app/

ENV PROJECT_PATH=$PROJECT_PATH
ENV NODE_ENV=$NODE_ENV

# Add
RUN groupadd -r www-app &&\
    useradd -r -g www-app www-app

RUN mkdir -p /home/www-app &&\
    chmod 777 /home/www-app -R

# Project folder
RUN mkdir -p $PROJECT_PATH &&\
    chown -R www-app:www-app $PROJECT_PATH

# Install the specified NODE_VERSION or grab latest
RUN n "$NODE_VERSION"

# Install Yarn
RUN npm install -g yarn

# Install Nodemon
COPY scripts/nodemon.json $PROJECT_PATH/

COPY scripts/run-nodock.sh /usr/bin/run-nodock
RUN chmod 700 /usr/bin/run-nodock

WORKDIR $PROJECT_PATH
