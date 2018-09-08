#!/bin/bash

docker run --rm -v $(pwd):/data -w /data ubuntu ls
