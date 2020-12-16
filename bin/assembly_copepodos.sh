###De Novo assembly of Leptodiaptomus###
###Javier Urbán###

###FASTQC###
##1 Review the quality of the reads
## fastq is used to check the quality of illumina reads before and after trimming
fastqc ../data/*.fastq.gz -o ../results/fastqc

###TRIMMOMATIC##
##trimmomatic is used to trim the readings by quality using the default parameters
trimmomatic PE -threads 2 ../data/FESIZTA_1.fastq.gz ../data/FESIZTA_2.fastq.gz ../results/FESIZTA_1.pair.fastq ../results/FESIZTA_1.unpair.fastq ../results/FESIZTA_2.pair.fastq ../results/FESIZTA_2.unpair.fastq ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

###PORECHOP###
porechop -i ../data/20190402_AAlcantara.fastq > ../results/QC_minion.fasta -o ../results/

###CANU###
##canu is used to correct the nanopore reads
canu -p CANU_MinION_correct -d CANU_MinION_correct genomeSize=400m -nanopore-corrected ../results/CANU_MinION_correct.fasta

###SMARTdenovo###
##SMARTdenovo SMARTdenovo is used to perform the assembly
smartdenovo.pl -p genome_lepto_Min -c 1 reads.fa > genome_lepto_Min.mak
make -f genome_lepto_Min.mak

###PILON###
##pilon is used to correct assembly errors using illumina short reads
##PILON uses pre-alignment of short reads to the newly assembled genome.
##alignment is done with botwie2
botwie2-build ../resluts/genome_lepto_Min.fa  ##index genome
botwie -x ../results/genome_lepto_Min  -1 FESIZTA_1.pair.fastq -2 FESIZTA_2.pair.fastq -S genome_lepto_alinea.sam

###SAMTOOLS###
##the samtools program is used to change the format of the .sam file to binary .bam
samtools view -b -S -o ../results/genome_lepto_alinea.bam genome_lepto_alinea.sam
samtools sort genome_lepto_alinea.bam -o genome_lepto_alinea.sorted.bam
samtools index -b genome_lepto_alinea.sorted.bam

##now you can run PILON
pilon --genome ../resluts/genome_lepto_Min.fa --frags genome_lepto_alinea.bam -output ../results/genome_corre

###RepearMasker###
##Repeatmasker is used to mask the repeated areas before prediction, it is run with a custom library of copepod genomes.
RepeatMasker -lib copepods.fa -species mammal -dir ../results/Masker -poly ../results/genome_corre.fasta


###BRAKER###
##BRAKER is software that GeneMark and Augustus use to train and predict genetic function
braker.pl --genome genome_corre.fasta --softmasking=on --workingdir ../results/marker
