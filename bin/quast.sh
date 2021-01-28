#!/bin/bash

##quast v:5.0.2##
##It is a tool to assess quickly the basic statistics of a genome assembly
mkdir -p ../results/quast_r
quast.py --large -t 6 -o ../results/quast_r/ ../results/L_sicilis_assembly.fasta.gz ../results/L_sicilis_assembly.masked.fa.gz
