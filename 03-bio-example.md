## Objective ##
Run a real-world bioinformatics application in a docker container

### Running BLAST from a container ###
We'll be running a BLAST (Basic Local Alignment Search Tool) example with a container from [BioContainers](https://biocontainers.pro).  

To begin, we'll pull the BLAST container (this will take a little bit):

```
docker pull biocontainers/blast
Using default tag: latest
latest: Pulling from biocontainers/blast
22dc81ace0ea: Pull complete
1a8b3c87dba3: Pull complete
...
Status: Downloaded newer image for biocontainers/blast:latest
```

We can run a simple command to verify the container workds:

```
docker run biocontainers/blast blastp -help

USAGE
  blastp [-h] [-help] [-import_search_strategy filename]
...
 -use_sw_tback
   Compute locally optimal Smith-Waterman alignments?
```

Let's download some data to start blasting:

```
> mkdir blast-example
> cd blast-example
> wget wget http://www.uniprot.org/uniprot/P04156.fasta
```

This is a human prion FASTA sequence.  We'll also need a reference database to blast against:

```
> curl -O ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz
> gunzip zebrafish.1.protein.faa.gz
```

We need to prepare the zebrafish database with `makeblastdb` for the search, but first we need to make our files available inside the containers. 

Docker has the ability to mount host directories into a container.  This allows you to add data to your container, as well as specify output directories you can use to store data after a container ends.  The docker daemon has a parameter called volume (`-v` or `--volume`), which we'll use to specify directories to be mounted.

The format is `-v/host/path:/container/path`.  Docker will create the directory inside the container if it present at runtime.  Be aware the behaviour is different if you use absolute or relative paths, we use absolute paths here.

To generate our database with data mounted into the blast container, we'll run the following:

```
> docker run -v `pwd`:/data/ biocontainers/blast makeblastdb -in zebrafish.1.protein.faa -dbtype prot
```

Note that I'm using ``` `pwd` ``` as a sortcut for the current working directory, where the BLAST files are located.  You should now see several new files, that are present after our docker container terminated.  We can now do the final alignment step:

```
> docker run -v `pwd`:/data/ biocontainers/blast blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt
```
The final results are stored in `results.txt`;
```
> less results.txt
                                                                     Score     E
equences producing significant alignments:                          (Bits)  Value

 XP_017207509.1 protein piccolo isoform X2 [Danio rerio]             43.9    2e-04
 XP_017207511.1 mucin-16 isoform X4 [Danio rerio]                    43.9    2e-04
 XP_021323434.1 protein piccolo isoform X5 [Danio rerio]             43.5    3e-04
 XP_017207510.1 protein piccolo isoform X3 [Danio rerio]             43.5    3e-04
 XP_021323433.1 protein piccolo isoform X1 [Danio rerio]             43.5    3e-04
 XP_009291733.1 protein piccolo isoform X1 [Danio rerio]             43.5    3e-04
 NP_001268391.1 chromodomain-helicase-DNA-binding protein 2 [Dan...  35.8    0.072
...
```
We can see that several proteins in the zebrafish genome match those in the human prion (interesting?).


### Conclusion ###
There are a lot of applications (not just bioinformatics) already wrapped up in container images.  Here's a small list of some of the repositories we use at Pawsey:

* [DockerHub](hub.docker.com)
* [Bioboxes](bioboxes.org)
* [Biocontainers](biocontainers.pro)
* [Nvidia GPU Cloud (NGC)](ngc.nvidia.com)*
* [quay.io](quay.io)*

The last two require you to create an account and login to access containers.

### Best practices ###

- don't re-invent the wheel, it's worth looking to see who's done what you want already