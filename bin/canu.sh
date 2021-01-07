#!/bin/bash

###canu v2.0###
##canu is used to correct the nanopore reads##
##The data coverage is low for the estimated genome size and was adjusted with the commands stopOnLowCoverage = 0.1 and minInputCoverage = 0.1
##se creó un directorio de salida antes de correr el programa
mkdir ../results/CANU
canu -p minion_canu -d ../results/CANU/ stopOnLowCoverage=0.1  minInputCoverage=0.1 genomeSize=400m -corrected -nanopore ../results/trimm_minion.fasta
