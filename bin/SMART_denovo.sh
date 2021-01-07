#!/bin/bash

###SMARTdenovo###
##is used to make the assembly
##a kmer = 17 was used according to what smartdenovo recommends for medium or large genomes
smartdenovo.pl -k 17 -p assembly_genome_lepto -c 1 ../results/CANU/minion_canu.contigs.fasta > ../results/assembly_genome_lepto.mak
make -f ../results/assembly_genome_lepto.mak
