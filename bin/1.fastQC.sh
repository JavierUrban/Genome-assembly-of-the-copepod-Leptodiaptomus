#!/bin/bash

##fastqc v0.11.8##
##FastQC: This software is used to visualize the quality of illumina sequences from an .html interface
##Command to generate quality report
fastqc ../data/*.fastq.gz -o ../results/fastqc
