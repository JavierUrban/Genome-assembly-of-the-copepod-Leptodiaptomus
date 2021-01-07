#!/bin/bash

##Assembly of genomes with reference##
##Javier Urbán##

##create the variable with the names of the results directories for each population
X="ATX PRE QUE ALCH FESIZTA"

##create the directories
for i in $X ;do
  mkdir ../results/$i:
##perform the quality analysis
   fastqc ../data/$i_1.fastq.gz ../data/$i_2.fastq.gz -o ../results/fastqc
##triming of adapters
   trimmomatic PE -threads 8 ../data/$i_1.fastq.gz ../data/$i_2.fastq.gz ../results/$i_1.pair.fastq ../results/$i_1.unpair.fastq \
   ../results/$i_2.pair.fastq ../results/$i_2.unpair.fastq ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36;
done
