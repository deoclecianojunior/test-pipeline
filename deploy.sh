#!/bin/bash

echo "Version: "

docker-compose build

docker tag pipeline_php:1.0.1 172.17.177.52:5000/pipeline_php:1.0.1

git push 172.17.177.52:5000/pipeline_php:1.0.1
