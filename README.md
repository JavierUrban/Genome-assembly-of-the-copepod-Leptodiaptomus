# Genome-assembly-of-the-copepod-*Leptodiaptomus*
This repository contains a short description of the workflow for the assembly and comparison of genomes of the copepod *Leptodiaptomus* *sicilis* group that is under a process of ecological speciation.

It´s organized in three folders

+ [`bin`](/bin) In this folder are the scripts that will help us obtain the results, each script assumes that the working directory is this folder, that the input files are in meta-data and that the outputs will go to results.

+ [`results`](/results/) In this folder are the results obtained, mainly graphs or tables obtained during the assembly process.

+ [`meta-data`](/meta-data/) Here are some tables or data of general information of the five study populations and that can be used for future analysis. 


## Generalities
 
Phylogenetically close copepod genomes often differ in size and gene content, as is the case with the copepod *L. sicilis* group. 

The size of the genome has been estimated by flow cytometry and the conversion to Mpb was carried out with the following function  ``picograms_to_Mpb(n)`` in R 

```
picograms_to_Mpb <- function(picograms) {
  ## converts picograms value to Mpb (million base pairs)
  ## Arguments:
  # Mpb: value of Mpb converted to be pg
  Mpb <- ((picograms*978)) ## 1pg = 978 Mpb
  return(Mpb)
}
```
The results are shown in the table.

| **Lago (Sp)**|**Genoma size (C-Value)**|**Genome size (Mpb)**|
|:----------|:----------   |:----------|
| Atexcac   | 0.37  | 361.86   |
| Carmen    | 0.41  | 400.98   |
| Preciosa  | 0.25  | 244.5    |
| Quechulac | 0.33  | 322.74   |
| Alchichica| 0.4   | 391.2    |

Copepods are a little-studied model, but in recent years they are becoming relevant as a genomic model (due to the wide adaptive evolution and the great difference in the size of their genomes) and ecological in aquatic environments. Our model is in a process of ecological speciation ([1](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0125524) and 2) however, the genomic bases of adaptive evolution are unknown in models like this, in order to have a better understanding of it we have the following objectives

   + 1.- Assembly and annotation of genome de *Novo*
   + 2.- Assembly genomes and compare with the reference.
   + 3.- Characterize divergent genomic regions subject to selection and adaptive evolution.


### Workflow

To comply with point 1 (de novo assembly) I will use the population that has a larger genome size, to be used as a reference and because I already have nanopore sequences and illumina sequences for the entire genome of this population ("El Carmen" ), therefore, we decided to follow the workflow proposed by [Shin *et al.,* (2019)](https://www.nature.com/articles/s41598-019-41549-8) for de novo assemblies using long sequences (MinION) and short sequences (illumina).

Raw sequencing data and heavy results are not here, if you want to know more, you can write to the following email [javierurban07@gmail.com](javierurban07@gmail.com)

![Workflow](/workflow.png)

Here is the general script that was used to make the *De Novo* assembly: [`DeNovo_assembly.sh`](https://github.com/JavierUrban/Genome-assembly-of-the-copepod-Leptodiaptomus/blob/main/bin/assembly_copepodos.sh). And below a small description of each step according to the workflow.

+ **Data cleaning**

Let's start by reviewing the quality status of the illumina sequences using the following script [fastQC.sh](/bin/fastQC.sh)

To check the quality of the MinION sequences we used the *software* fastp in the script [fastp.sh](/bin/fastp.sh). And to trim the adapters it was done with [porechop.sh](/bin/porechop.sh)


+ **Assembly testing**

+ **Hybrid assembly**

+ **Assembly polishing**


### *Software* versions used 
[**Fastqc:v0.11.8**](https://hub.docker.com/layers/biocontainers/fastqc/v0.11.8dfsg-2-deb_cv1/images/sha256-9d41ec0bc4f413abe9e5290c91e3edfaa215fc47e8e11df18691cfa870df6d91?context=explore)

[**Porechop:v0.2.4**](https://github.com/rrwick/Porechop)

[**Canu:v1.8**](https://hub.docker.com/r/biocontainers/canu/tags)

[**Trimmomatic:v0.38**](https://hub.docker.com/r/davelabhub/trimmomatic/tags)

### References 

+ [Barrera-Moreno, O. A., Ciros-Pérez, J., Ortega-Mayagoitia, E., Alcántara-Rodríguez, J. A., & Piedra-Ibarra, E. (2015). From local adaptation to ecological speciation in copepod populations from neighboring lakes. PloS one, 10(4), e0125524.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0125524)

* [Shin, S. C., Kim, H., Lee, J. H., Kim, H. W., Park, J., Choi, B. S., & Kim, S. (2019). Nanopore sequencing reads improve assembly and gene annotation of the *Parochlus steinenii* genome. Scientific Reports, 9(1), 1-10.](https://www.nature.com/articles/s41598-019-41549-8)

+ Ortega-Mayagoitia, E., Alcántara-Rodriguez, J. A., Urbán-Olivares, J., Campos-Contreras, J. E., & Ciros-Pérez, J. (2020). Genomic evidence of adaptive evolution patterns in lacustrine calanoid copepods. Molecular Ecology (in review).

