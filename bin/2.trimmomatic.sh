##Trimmomatic v0.39##
##illumina sequence trimming

trimmomatic PE -threads 6 ../data/FESIZTA_1.fastq.gz ../data/FESIZTA_2.fastq.gz ../results/FESIZTA_1.pair.fastq ../results/FESIZTA_1.unpair.fastq \
../results/FESIZTA_2.pair.fastq ../results/FESIZTA_2.unpair.fastq ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

##It was used with default parameters
##This will perform the following:
   ##remove adapters (ILLUMINACLIP:TruSeq3-PE.fa:2:30:10)
   ##remove leading low quality or N bases (below quality 3) (LEADING:3)
   ##remove trailing low quality or N bases (below quality 3) (TRAILING:3)
   ##scan the read with a 4-base wide sliding window, cutting when the average quality per base drops below 15 (SLIDINGWINDOW:4:15)
   ##drop reads below the 36 bases long (MINLEN:36)
