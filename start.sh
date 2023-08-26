#!/bin/bash

git clone https://github.com/damn-war/setup.git

openssl enc -d -aes-256-cbc -in ssh.tar.gz.enc -out ssh.tar.gz
mkdir .ssh
tar xzvf ssh.tar.gz -C .ssh
openssl enc -d -aes-256-cbc -in env.enc -out .env

docker run -it -v $PWD:/repositories \
  -v ./.ssh:/root/.ssh \
  -v ./.gitconfig:/root/.gitconfig \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --env-file ./.env \
  -it dariusmurawski/lunarvim:latest
