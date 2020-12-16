###Search, assembly and comparison of mitogenomes###
##Javier Urbán##

###TRIMMOMATIC###
##Trimming of reads by quality and adapters###
##trimming is performed for the reads of the 5 genomes##
X="ATX PRE QUE ALCH FESIZTA"
for i in $X ;do
  trimmomatic PE -threads 2 ../data/$i_1.fastq.gz ../data/$i_2.fastq.gz ../results/$i_1.pair.fastq ../results/$i_1.unpair.fastq ../results/$i_2.pair.fastq ../results/$i_2.unpair.fastq ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36;
done

###BOTWIE2###
##Mitochondria sequences are identified and extracted using as reference those from databases of other copepodoes
botwie2-build ../data/genome_mitochondrias_copes.fa  ##index genome
for i in $X ;do
  bowtie -x ../data/genome_mitochondrias_copes  -1 $i_1.pair.fastq -2 $i_2.pair.fastq -S genome_lepto_alinea.sam --al-conc ../results/$i_mit_recup_1.fastq ../results/$i_mit_recup_2.fastq;
done

###SPADES###
##assembly of the mitochondria of each population
for i in $X ;do
   spades.py --careful -1 ../results/$i_mit_recup_1.fastq  -2 ../results/$i_mit_recup_1.fastq -k 21,33,55,77 -o $i_SPADES;
done
