# Genome-assembly-of-the-copepod-*Leptodiaptomus*

## Generalities

This repository contains a short description of the workflow for the assembly and comparison of genomes of the copepod Leptodiaptomus sicilis group.

<p align="center">
  <img src="/images/Leptodiaptomus sicilis group.png">
</p>

Copepods are a little-studied model, but in recent years they are gaining relevance as a genomic model because they have shown extensive adaptive evolution, colonizing almost any aquatic system, and it has been observed that the genomes of phylogenetically close copepods may differ in size and structure. genetics, as is the case with the copepod group L. sicilis. This model is in a process of ecological speciation (1 and 2) which is mainly promoted by the contrast in salinity and permanence of the habitat (Table 1). However, the genomic bases of adaptive evolution are unknown and to better understand these bases we have set the following objectives:

   + 1.- Assembly and annotation of genome de *Novo*
   + 2.- Assembly genomes and compare with the reference.
   + 3.- Characterize divergent genomic regions subject to selection and adaptive evolution.

<p align="center">Key ecological features of the four lakes inhabited by
L. sicilis group</p>

<p align="center">
  <img src="/images/Table1.png">
</p>

This repository is a report and a guide to the bioinformatics methodology used to meet the objectives set. Genome size and type of sequences used are briefly summarized in Table 2. The short sequences (illumina) were created unique dual-indexed (UDI) TruSeq Nano DNA libraries and sequenced on a single lane of a NovaSeq SP 2x150-bp run. And the long sequences (PacBio) were created with a express 20 Kb library and sequenced on a sequel II 8M SMRT cell using continuous long read (CLR) method.

<p align="center">
  <img src="/images/Table2.png">
</p>

The size of the genome has been estimated by flow cytometry and the conversion to Mpb was carried out with a function in R: [`picograms_to_Mpb(n)`](/bin/picograms_to_Mpb.R)

The workflow is structured in four parts, following different bioinformatic strategies that depend on the data type. 1)De novo assembly and annotation of the El carmen genome (MinIon + illumina). 2)De novo assembly and annotation of the Atexcac genome (PacBio + illumina). 3)Assembly with reference for the rest of the populations (illumina) 4). Comparison of the 5 genomes and identification of variants. At the moment only the strategies of step 1 and 2 are presented and as progress is made the repository will be updated.

## Pre-requirements (*Software* versions) 

[**Fastqc:v0.11.8**](https://hub.docker.com/layers/biocontainers/fastqc/v0.11.8dfsg-2-deb_cv1/images/sha256-9d41ec0bc4f413abe9e5290c91e3edfaa215fc47e8e11df18691cfa870df6d91?context=explore)

[**Trimmomatic:v0.39**](http://www.usadellab.org/cms/?page=trimmomatic)

[**Porechop:v0.2.4**](https://github.com/rrwick/Porechop)

[**Canu:v2.0**](https://github.com/marbl/canu/releases/tag/v2.0)

[**SMARTdenovo:v2.12**](https://github.com/ruanjue/smartdenovo)

[**bwa:v0.7.17**](https://github.com/lh3/bwa)

[**SAMtools:v0.1.20**](http://www.htslib.org/)

[**Pilon:1.23**](https://github.com/broadinstitute/pilon/releases/)

[**BUSCO:v5.0.0](https://busco.ezlab.org/busco_userguide.html)

[**QUAST:v5.0.2](https://github.com/ablab/quast)

## Repository structure

The repository is organized into five folders for better monitoring and visualization:

+ **[`/bin/`](/bin)** In this folder are the scripts that will help us obtain the results, each script assumes that the working directory is this folder, that the input files are in meta-data and that the outputs will go to results.

+ **[`/courses/`](/courses)** The creation of this repository arose as part of a project in a [bioinformatics workshop](https://github.com/AliciaMstt/TallerBioinf), and in this folder there are files that are not necessary for the precented workflows, but that were part of the course work.

+ **[`/images/`](/images)** Here they are deposited all images that have been used to illustrate this repository

+ **[`/results/`](/results)** In this folder are the results obtained, mainly graphs or tables obtained during the assembly process.

+ **[`/meta-data/`](/meta-data)** Here are some tables or data of general information of the five study populations and that can be used for future analysis. 

**Nota:** Because the work is not yet published and the weight of most of the data and results is large, they are not here, but if there is any doubt or question, you can write an issue here or send an email to [javierurban07@gmail.com](javierurban07@gmail.com)

## Workflows structure

### <p align="center">Workflow to de *Novo* assembly of the "El Carmen" </p>

<p align="center">
  <img src="/images/workflow.png">
</p>

The first de novo assembly is carried out with the population of El Carmen and the protocol suggested by [Shin *et al.,* (2019)](https://www.nature.com/articles/s41598-019-41549-8) was followed. Since it is designed and tested as a good workflow to improve the integrity of hybrid genomes with MinION and Illumina sequences.

To generate the results in this workflow you can run the script: **[DeNovo_assembly.sh](/bin/DeNovo_assembly.sh)**. And if you want to follow each step, here is the order in which they should be executed and a short description of each step:

+ **Data Cleaning** 
 
 1.- [FastQC](/bin/1.fastQC.sh): It is used to review the quality of Illumina reads and helps you better decide on trimming and clean parameters.  

 2.- [Trimmomatic](/bin/2.trimmomatic.sh): Here low quality bases or reads and sequenced illumina adapters are trimmed to improve genome quality and integrity.
 
 3.- [Porechop](/bin/3.porechop.sh) It is also used to trim bases or low-quality sequences but is exclusive of adapters and MinION sequences.
     
+ **Assembly Genome**

 4.- [Canu](/bin/4.canu.sh): It is used to generate corrected sequences to improve the precision of the bases and to make the assembly with these sequences.
 
 5.- [SMARTdenovo](/bin/5.SMART_denovo.sh): Finally this is the assembler for long reads with which the assembly was made using corrected sequences.
 
+ **Assembly Polishing**

 6.- [BWA](/bin/6.bwa.sh): Is for aligning the illumina short reads to the newly assembled genome draft in order to correct the assembly and fill in gaps
 
 7.- [Samtools](/bin/7.samtools.sh): Is for sorting and indexing the data.
 
 8.- [Pilon](/bin/8.pilon.sh): Finally helps us to automatically polish and improve genome orientation based on coverage. 
   
### References 

+ [Barrera, M. O. A., Ciros, P. J., Ortega, M. E., Alcántara, R. J. A., & Piedra, I. E. (2015). From local adaptation to ecological speciation in copepod populations from neighboring lakes. PloS one, 10(4), e0125524.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0125524)

* [Shin, S. C., Kim, H., Lee, J. H., Kim, H. W., Park, J., Choi, B. S., & Kim, S. (2019). Nanopore sequencing reads improve assembly and gene annotation of the *Parochlus steinenii* genome. Scientific Reports, 9(1), 1-10.](https://www.nature.com/articles/s41598-019-41549-8)

+ Ortega, M. E., Alcántara, R. J. A., Urbán, O. J., Campos, C. J. E., & Ciros, P. J. (2020). Genomic evidence of adaptive evolution patterns in lacustrine calanoid copepods. Molecular Ecology (in review).

