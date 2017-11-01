#!/usr/bin/env bash

STATE_FILE=/tmp/provision

function once() {
  if ! grep -q ${1} ${STATE_FILE}; then
    echo "* * * Provisioning ${1}"
    (${1}) && echo ${1} >> ${STATE_FILE}
  else
    echo "Skipping ${1} ..."
  fi
}


function update() {
  apt-get update -y 
  # && sudo apt-get upgrade -y
}

function couchdb() {
  apt-get install -y couchdb
}

function dbs() {
  curl -X PUT localhost:5984/testdb1
  curl -X POST http://localhost:5984/testdb1/  -H "Content-Type: application/json" -d '{ "color" : "blue" }'
  curl -X PUT localhost:5984/testdb2
  curl -X POST http://localhost:5984/testdb1/  -H "Content-Type: application/json" -d '{ "number" : "two" }'
  curl -X PUT localhost:5984/testdb3
  curl -X POST http://localhost:5984/testdb1/  -H "Content-Type: application/json" -d '{ "car" : "pinto" }'
}

once update
once couchdb
once dbs

