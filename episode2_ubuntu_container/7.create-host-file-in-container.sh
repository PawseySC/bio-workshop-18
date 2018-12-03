#!/bin/bash

echo Creating file inside container
docker run --rm -v $(pwd):/data -w /data ubuntu echo "Sunny day in Perth!" >weather

echo Displaying file outside container
cat weather
