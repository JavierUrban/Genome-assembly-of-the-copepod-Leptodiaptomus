#!/bin/bash

##pilon v1.23##
##the -frags option is used to use alignment from pair-end sequences
##and depending on the size of the data it is important to assign the number of ram memory with --Xmx
mkdir -p ../results/genome_pulido
pilon --genome ../results/assembly_genome_lepto.fa.gz --frags ../results/aln_genoma_illu.sorted.bam --output ../results/genome_pulido/ --threads 10 --mingap 8 -Xmx32G
