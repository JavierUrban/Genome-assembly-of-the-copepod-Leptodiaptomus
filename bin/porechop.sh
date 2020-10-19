
#!/bin/bash

##to download porechop in docker
docker pull docker pull biocontainers/porechop:v0.2.4dfsg-1-deb_cv1
porechop="docker run --rm -v /Users/javier/Documents/Docker/genoma_cope:/data biocontainers/porechop:v0.2.4dfsg-1-deb_cv1 porechop"

##recorte y calidad
## > is the output of the clipped sequences
## -o trimmed adapters and adapters report
## adapter identity (default is 90%, can be changed with --adapter_threshold)
$porechop -i ../meta-data/20190402_AAlcantara.fastq > ../results/QC_minion.fasta -o ../results/ -t 2
