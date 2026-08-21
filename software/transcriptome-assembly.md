(transcriptome-assembly)=
# Transcriptome Assembly 


(stringtie)=
## 1. [StringTie](https://github.com/gpertea/stringtie/wiki)

A fast and accurate transcript assembler and abundance estimator for RNA-seq data. Designed as a successor to Cufflinks, StringTie assembles transcripts from the alignments produced by TopHat2, HISAT, or other spliced aligners, and quantifies those transcripts.

**Categories:** transcriptome-assembly  
**Publication:** [PMC4707948](https://pmc.ncbi.nlm.nih.gov/articles/PMC4707948/)



(tiebrush)=
## 2. [TieBrush](https://github.com/alevar/tiebrush)

A utility for efficiently merging redundant information from multiple alignment files, designed to enable rapid manipulation of extremely large datasets (RNA-seq, whole-genome, exome, etc.). Data representations built with TieBrush and TieCov can be used for easier programmatic and visual analysis and comparison of groups within large sequencing datasets.

**Categories:** transcriptome-assembly  
**Publication:** [PMC8545345](https://pmc.ncbi.nlm.nih.gov/articles/PMC8545345/)



(eastr)=
## 3. [EASTR](https://github.com/salzberg-lab/EASTR/wiki)

EASTR is a tool for detecting spuriously spliced alignments and junctions in RNA-seq datasets and reference annotations. It improves the accuracy of downstream analyses, such as transcriptome assembly, by identifying and removing misaligned spliced alignments. The tool can process GTF, BED, and BAM files as input.

**Categories:** transcriptome-assembly  
**Publication:** [PMC10632439](https://pmc.ncbi.nlm.nih.gov/articles/PMC10632439/)



(gffread)=
## 4. [GffRead](https://github.com/gpertea/gffread/wiki)

A program for filtering, converting, and manipulating GFF files.

**Categories:** transcriptome-assembly  
**Publication:** [PMC7222033](https://pmc.ncbi.nlm.nih.gov/articles/PMC7222033/)



(gffcompare)=
## 5. [GffCompare](https://github.com/gpertea/gffcompare/wiki)

A program for comparing, annotating, merging, and tracking transcripts in GFF files.

**Categories:** transcriptome-assembly  
**Publication:** [PMC7222032](https://pmc.ncbi.nlm.nih.gov/articles/PMC7222032/)



(transigner)=
## 6. [TranSigner](https://github.com/haydenji0731/transigner)

TranSigner improves transcriptome expression quantification through accurate assignment of long RNA sequencing reads.

**Categories:** transcriptome-assembly  
**Publication:** [PMC11343119](https://pmc.ncbi.nlm.nih.gov/articles/PMC11343119/)



(spit)=
## 7. [SPIT](https://github.com/berilerdogdu/SPIT)

SPIT detects differential transcript usage in complex diseases.

**Categories:** transcriptome-assembly  
**Publication:** [PMC10985272](https://pmc.ncbi.nlm.nih.gov/articles/PMC10985272/)



(phylocsf-plus-plus)=
## 8. [PhyloCSF++](https://github.com/cpockrandt/PhyloCSFpp)

PhyloCSF++ is a fast and user-friendly implementation of PhyloCSF with annotation tools.

**Categories:** transcriptome-assembly  
**Publication:** [PMC9991890](https://pmc.ncbi.nlm.nih.gov/articles/PMC9991890/)



(cufflinks)=
## 9. [Cufflinks](https://cole-trapnell-lab.github.io/cufflinks/)

A transcript assembler and abundance estimator for RNA-seq data. Cufflinks assembles transcripts from the alignments produced by TopHat, including novel isoforms, and quantifies those transcripts. Cufflinks was originally developed by Cole Trapnell and is supported by his lab at the University of Washington.

**Categories:** transcriptome-assembly  
**Publication:** [PMC3334321](https://pmc.ncbi.nlm.nih.gov/articles/PMC3334321/)



(ballgown)=
## 10. [Ballgown](https://github.com/alyssafrazee/ballgown)

A program for computing differentially expressed genes in two or more RNA-seq experiments, using the output of StringTie or Cufflinks. The Ballgown package provides functions to organize, visualize, and analyze expression measurements. Ballgown is written in R and is part of Bioconductor.

**Categories:** transcriptome-assembly  
**Publication:** [PMC4792117](https://pmc.ncbi.nlm.nih.gov/articles/PMC4792117/)



(edge-pro)=
## 11. [EDGE-pro](https://github.com/TMAGOC/edge-pro/wiki)

EDGE-pro is a program for estimating gene expression from prokaryotic RNA-seq. EDGE-pro uses Bowtie2 for alignment but, unlike TopHat and Cufflinks, does not allow spliced alignments. It also handles overlapping genes, a common phenomenon in bacteria that is largely absent in eukaryotes.

**Categories:** transcriptome-assembly  
**Publication:** [PMC3603529](https://pmc.ncbi.nlm.nih.gov/articles/PMC3603529/)



