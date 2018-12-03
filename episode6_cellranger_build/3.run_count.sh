#!/bin/bash

docker run --rm -v $(pwd):/data -w /data -p 8080:8080 bskjerven/cellranger cellranger count --id=test --transcriptome=refdata-cellranger-ercc92-1.2.0/ --fastqs=tiny-bcl/outs/fastq_path --uiport=8080

