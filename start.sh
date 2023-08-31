#!/bin/bash

# git clone https://github.com/damn-war/setup.git
echo "path to your repositories"
read
openssl enc -d -aes-256-cbc -in ssh.tar.gz.enc -out ssh.tar.gz -k $pass
mkdir .ssh
tar xzvf ssh.tar.gz -C .ssh
openssl enc -d -aes-256-cbc -in env.enc -out .env -k $oass

docker run -it -v $REPLY:/repositories \
  -v ./.ssh:/root/.ssh \
  -v ./.gitconfig:/root/.gitconfig \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --env-file ./.env \
  -it dariusmurawski/lunarvim:latest
