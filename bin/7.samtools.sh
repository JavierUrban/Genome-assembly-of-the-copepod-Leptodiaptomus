#!/bin/bash

##samtools v0.1.20##
##the samtools program is used to change the format of the .sam file to binary .bam 
samtools view -S -b ../results/aln_genoma_illu.sam > ../results/aln_genoma_illu.bam
samtools sort ../results/aln_genoma_illu.bam ../results/aln_genoma_illu.sorted.bam
samtools index ../results/aln_genoma_illu.sorted.bam
