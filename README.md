# Genome-assembly-of-the-copepod-Leptodiaptomus
This repository contains a short description of the workflow for the assembly and comparison of genomes of the copepod Leptodiaptomus group sicilis that is under a process of ecological speciation.

It´s organized in three folders

+ [`bin`](https://github.com/JavierUrban/Genome-assembly-of-the-copepod-Leptodiaptomus/tree/main/bin) In this folder are the scripts that will help us obtain the results, each script assumes that the working dicercty is this folder, that the input files are in meta-data and that the outputs will go to results.

+ [`results`](https://github.com/JavierUrban/Genome-assembly-of-the-copepod-Leptodiaptomus/tree/main/results) In this folder are the results obtained, mainly graphs or tables obtained during the assembly process.

+ [`meta-data`](https://github.com/JavierUrban/Genome-assembly-of-the-copepod-Leptodiaptomus/tree/main/meta-data) Here are some tables or data of general information of the five study populations and that can be used for future analysis. 


## Generalities
 
Phylogenetically close copepod genomes often differ in size and gene content, as is the case with the copepod L. group sicilis. 

The size of the genome has been estimated by spectrophotometry and the conversion to Mpb was carried out with the following function ``picograms_to_Mpb(n)`` 

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

   + 1.- Assemble and annotate a Novo genome
   + 2.- Assemble genomes and compare with the reference.
   + 3.- Characterize divergent genomic regions subject to selection and adaptive evolution.


### Wordflow

To meet the first objective, we decided to follow the workflow proposed by [Shin *et al.,* (2019)](https://www.nature.com/articles/s41598-019-41549-8) for assemblies hybrids using long sequences (MinION) and short sequences (illumina). This workflow is used for the Novo assembly using data from the "El Carmen" population.

Raw sequencing data and heavy results are not here, if you want to know more, you can write to the following email [javierurban07@gmail.com](javierurban07@gmail.com)

![Wordflow](https://github.com/JavierUrban/Genome-assembly-of-the-copepod-Leptodiaptomus/blob/main/wordflow.png)

According to this workflow, it was decided to divide the process into the following steps:

+ **Data cleaning**

Let's start by reviewing the quality status of the illumina sequences usando el siguiente script [fastQC.sh](https://github.com/JavierUrban/Genome-assembly-of-the-copepod-Leptodiaptomus/blob/main/bin/fastQC.sh)

Minion sequences for review the quality of the sequence with software FASTP [(script fastp.sh)](https://github.com/JavierUrban/Genome-assembly-of-the-copepod-Leptodiaptomus/blob/main/bin/fastp.sh)


+ **Assembly testing**

+ **Hybrid assembly**

+ **Genome polishing**


### Software versions used 

### References 

+ [Barrera-Moreno, O. A., Ciros-Pérez, J., Ortega-Mayagoitia, E., Alcántara-Rodríguez, J. A., & Piedra-Ibarra, E. (2015). From local adaptation to ecological speciation in copepod populations from neighboring lakes. PloS one, 10(4), e0125524.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0125524)

* [Shin, S. C., Kim, H., Lee, J. H., Kim, H. W., Park, J., Choi, B. S., & Kim, S. (2019). Nanopore sequencing reads improve assembly and gene annotation of the Parochlus steinenii genome. Scientific Reports, 9(1), 1-10.](https://www.nature.com/articles/s41598-019-41549-8)
