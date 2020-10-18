#!/bin/bash

##FastQC: This software is used to visualize the quality of illumina sequences from an .html interface
## To run fastqc a downloaded Docker container was used on a local computer.
docker pull biocontainers/fastqc:v0.11.8dfsg-2-deb_cv1
fastqc="docker run --rm -v /Users/javier/Documents/Docker/genoma_cope:/data biocontainers/fastqc:v0.11.8dfsg-2-deb_cv1 fastqc"

##Command to generate quality report
$fastqc ../meta-data/CAR-16_S2_R1_001.fastq  ../meta-data/CAR-16_S2_R2_001.fastq  -o ../results/
