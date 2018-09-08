#!/bin/bash

docker ps -a

docker rm $(docker ps -aq)
