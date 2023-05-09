# Commands

## Create docker network

docker network create tutorial-mongo-network

## Start mongodb

docker run -d \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=password \
--net tutorial-mongo-network \
--name tutorial-mongodb \
mongo

## Start mongo-express

docker run -d \
-p 8081:8081 \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
-e ME_CONFIG_MONGODB_SERVER=tutorial-mongodb \
--net tutorial-mongo-network \
--name tutorial-mongo-express \
mongo-express
