#!/bin/bash

ssh-keygen -t rsa -N '' -f "./ssh/foobar/id_rsa" <<< y
ssh-keygen -t rsa -N '' -f "./ssh/root/id_rsa" <<< y

mkdir -p containers/client/ssh/foobar
mkdir -p containers/client/ssh/root
cp -r ./ssh/foobar containers/client/ssh/foobar
cp -r ./ssh/root containers/client/ssh/root

mkdir -p containers/server/ssh/foobar
mkdir -p containers/server/ssh/root
cp -r ./ssh/foobar containers/server/ssh/foobar
cp -r ./ssh/root containers/server/ssh/root

docker-compose up -d --build