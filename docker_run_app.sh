#!/bin/bash

#pre-cond: ./docker_run_db.sh

docker run -v ~/.aws:/root/.aws \
    -e "AWS_PROFILE=$AWS_PROFILE" \
    -e 'ASPNETCORE_ConnectionStrings__main=Server=database;Database=tempdb;User Id=sa;Password=Password!123' \
    -e 'ASPNETCORE_queues__main=https://sqs.eu-central-1.amazonaws.com/028619293920/test-78A45E7A-689D-4BF4-88B3-3D35FDF5807F'
    -it --rm -p 8080:80 --link database myimage
