#!/bin/bash

docker run --rm -v $(pwd):/data -w /data -p 8080:8080 bskjerven/cellranger cellranger mkfastq --id=tiny-bcl --run=cellranger-tiny-bcl-1.2.0 --csv=cellranger-tiny-bcl-samplesheet-1.2.0.csv --uiport=8080
