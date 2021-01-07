
#!/bin/bash

###porechop v0.2.4###
##trimming by quality of nanopore reads##
## -v 1 shows a summary of the trimming process
porechop -i ../data/20190402_AAlcantara.fastq -o ../results/trimm_minion.fasta -t 6 -v 1

##the adapters were not specified and by default porechop searches for all nenopore adapters, which may vary depending on the version of porechop
