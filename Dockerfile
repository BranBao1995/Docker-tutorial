# Our image needs to be based on another image, in this case it is the node image, beacause our application uese node.js
# when the image is run, node.js will be installed first in the host's virtual environment
FROM node:13-alpine

# this is optional, because these env variables are already defined in the docker-compose file, and it is better to define these
# in the docker-compose file
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# this directory will be created when the image is run
RUN mkdir -p /home/app

# copy files from the ./app directory from host to the newly created /home/app directory in the container
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
# RUN npm install

# commands that need to be executed in the terminal of the container
# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]


# You need to rebuild an image whenever you make modification to the Dockerfile!
