#!/bin/bash

##BUSCO v5.0.0##
##BUSCO assesses the integrity of genomes based on single-copy orthologs genes for a taxonomic group

mkdir -p ../results/busco
busco -m genome -i ../results/L_sicilis_assembly.fasta.gz -l arthropoda_odb10 -o ../results/busco
generate_plot.py ../results/busco
