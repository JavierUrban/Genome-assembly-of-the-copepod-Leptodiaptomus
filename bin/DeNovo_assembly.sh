###De Novo assembly of the coppepod Leptodiaptomus###
###Javier Urbán###
##It is a assembly of novo with nanopore and illumina reads##

###FASTQC###
##1 Review the quality of the reads
## fastq is used to check the quality of illumina reads before and after trimming
fastqc ../data/*.fastq.gz -o ../results/fastqc

###TRIMMOMATIC##
##trimmomatic is used to trim the readings by quality using the default parameters
trimmomatic PE -threads 6 ../data/FESIZTA_1.fastq.gz ../data/FESIZTA_2.fastq.gz ../results/FESIZTA_1.pair.fastq ../results/FESIZTA_1.unpair.fastq ../results/FESIZTA_2.pair.fastq ../results/FESIZTA_2.unpair.fastq ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

###PORECHOP###
##trimming by quality of nanopore reads##
## -v 1 shows a summary of the trimming process
porechop -i ../data/20190402_AAlcantara.fastq -o ../results/trimm_minion.fasta -t 6 -v 1

###CANU###
##canu is used to correct the nanopore reads##
##The data coverage is low for the estimated genome size and was adjusted with the commands stopOnLowCoverage = 0.1 and minInputCoverage = 0.1
mkdir ../results/CANU
canu -p minion_canu -d ../results/CANU/ stopOnLowCoverage=0.1  minInputCoverage=0.1 genomeSize=400m -corrected -nanopore ../results/trimm_minion.fasta

###SMARTdenovo###
##is used to make the assembly
smartdenovo.pl -k 17 -p assembly_genome_lepto -c 1 ../results/CANU/minion_canu.contigs.fasta > ../results/assembly_genome_lepto.mak
make -f ../results/assembly_genome_lepto.mak

###PILON###
##The program needs a alignment file of the illumina reads with the reference genome
##the alignment is done with bwa
bwa index ../results/assembly_genome_lepto.fa.gz ##index genome
bwa mem -x ont2d ../results/assembly_genome_lepto.fa.gz ../results/FESIZTA_1.pair.fastq ../results/FESIZTA_2.pair.fastq > ../results/aln_genoma_illu.sam

###SAMTOOLS###
##the samtools program is used to change the format of the .sam file to binary .bam
samtools view -S -b ../results/aln_genoma_illu.sam > ../results/aln_genoma_illu.bam
samtools sort ../results/aln_genoma_illu.bam ../results/aln_genoma_illu.sorted.bam
samtools index ../results/aln_genoma_illu.sorted.bam

##now you can run PILON
mkadir ../results/genome_pulido
pilon --genome ../results/assembly_genome_lepto.fa.gz --frags ../results/aln_genoma_illu.sorted.bam --output ../results/genome_pulido/ --threads 10 --mingap 8 -Xmx32G 

###RepearMasker###
##Repeatmasker is used to mask the repeated areas before prediction, it is run with a custom library of copepod genomes.
RepeatMasker -lib copepods.fa -species mammal -dir ../results/Masker -poly ../results/genome_corre.fasta


###BRAKER###
##BRAKER is software that GeneMark and Augustus use to train and predict genetic function
braker.pl --genome genome_corre.fasta --softmasking=on --workingdir ../results/marker
