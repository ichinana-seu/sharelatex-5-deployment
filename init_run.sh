#!/bin/bash
echo "Initiating Mongo replica set..."
docker-compose up -d mongo
docker-compose exec -T mongo sh -c '
    while ! mongosh --eval "db.version()" > /dev/null; do
      echo "Waiting for Mongo..."
      sleep 1
    done
    mongosh --eval "db.isMaster().primary || rs.initiate({ _id: \"overleaf\", members: [ { _id: 0, host: \"mongo:27017\" } ] })" > /dev/null'
