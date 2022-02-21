#!/bin/bash

rm -rf ./dist/*
mkdir -p ./dist/ssh/foobar;
mkdir -p ./dist/ssh/root;
mkdir -p ./dist/containers/server/ssh/foobar
mkdir -p ./dist/containers/server/ssh/root
mkdir -p ./dist/containers/client/ssh/foobar
mkdir -p ./dist/containers/client/ssh/root
ssh-keygen -t rsa -f "./dist/ssh/foobar/id_rsa" -P ''
ssh-keygen -t rsa -f "./dist/ssh/root/id_rsa" -P '' 

cp -r ./src/containers/** ./dist/containers/
cp -r ./dist/ssh/foobar/** ./dist/containers/client/ssh/foobar
cp -r ./dist/ssh/root/** ./dist/containers/client/ssh/root
cp -r ./dist/ssh/foobar/** ./dist/containers/server/ssh/foobar
cp -r ./dist/ssh/root/** ./dist/containers/server/ssh/root
rm -rf ./dist/ssh

cp ./src/.env-dist ./dist/.env
cp ./src/docker-compose.yml ./dist/docker-compose.yml

cd ./dist/
docker-compose down
docker-compose up -d --build
docker ps