#!/bin/bash
if [ ! -f "$MONGO_DBPATH/leanote.0" ]; then
  mongod --dbpath $MONGO_DBPATH --logpath=$MONGO_LOG/mongodb.log --fork
  mongorestore -h localhost -d leanote --dir $GOPATH/src/github.com/leanote/leanote/mongodb_backup/leanote_install_data/
else
  mongod --dbpath $MONGO_DBPATH --logpath=$MONGO_LOG/mongodb.log --fork
fi
revel run github.com/leanote/leanote prod
