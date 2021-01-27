#!/bin/bash

##bwa v0.7.17##
##alignment was done using the -ont2d option used for nanopore data
##and only the .pair files of the illumina sequences were used
bwa index ../results/assembly_genome_lepto.fa.gz ##index genome
bwa mem -x ont2d ../results/assembly_genome_lepto.fa.gz ../results/FESIZTA_1.pair.fastq ../results/FESIZTA_2.pair.fastq > ../results/aln_genoma_illu.sam
