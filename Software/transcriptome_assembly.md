## Transcriptome Assembly

### [StringTie](https://github.com/dpuiu/stringtie/wiki) <!--(https://github.com/gpertea/stringtie/wiki) -->

A fast and accurate transcript assembler and abundance estimator for RNA-seq
data. Designed as a successor to Cufflinks, StringTie assembles transcripts from
the alignments produced by TopHat2, HISAT, or other spliced aligners, and
quantitates those transcripts.

### [TieBrush](https://github.com/alevar/tiebrush)

A utility for efficient merging redundant information from multiple alignment
files designed to enable rapid manupulation of extremely large datasets
(RNA-seq, whole genome, exome, etc.). Data representations built with TieBrush
and TieCov can be used for easier programmatic and visual analysis and
comparison of groups within large sequencing datasets.

### [EASTR](https://github.com/dpuiu/EASTR/wiki) <!--(https://github.com/dpuiu/EASTR/wiki)-->

EASTR is a tool for detecting spuriously spliced alignments and junctions in
RNA-seq datasets and reference annotations. It improves the accuracy of
downstream analyses, such as transcriptome assembly, by dentifying and removing
misaligned spliced alignments. The tool can process GTF, BED, and BAM files as
input.

### [GffRead](https://github.com/dpuiu/gffread/wiki) <!--(https://github.com/gpertea/gffread/wiki) -->

A program for filtering, converting and manipulating GFF files

### [GffCompare](https://github.com/dpuiu/gffcompare/wiki) <!--(https://github.com/gpertea/gffcompare/wiki) -->

A program for comparing, annotating, merging and tracking transcripts in GFF files


---

## Older Software

### [Cufflinks](https://cole-trapnell-lab.github.io/cufflinks/)

A transcript assembler and abundance estimator for RNA-seq data. Cufflinks
assembles transcripts from the alignments produced by TopHat, including novel
isoforms, and quantitates those transcripts. Cufflinks was originally developed
by Cole Trapnell and is supported by his lab at the University of Washington.

### [Ballgown](https://github.com/alyssafrazee/ballgown)

A program for computing differentially expressed genes in two or more RNA-seq
experiments, using the output of StringTie or Cufflinks. The Ballgown package
provides functions to organize, visualize, and analyze expression measurements.
Ballgown is written in R and is part of Bioconductor.

### [EDGE-pro](/EDGE-pro/index)

EDGE-pro is a program for estimating gene expression from prokaryotic RNA-seq.
EDGE-pro uses Bowtie2 for alignment but, unlike TopHat and Cufflinks, does not
allow spliced alignments. It also handles overlapping genes, a common phenomenon
in bacteria that is largely absent in eukaryotes.
