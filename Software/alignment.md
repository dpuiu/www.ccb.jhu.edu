## Next-generation Sequence Alignment Software

### [Arioc](https://github.com/rwilton/arioc)

Arioc is a GPU-accelerated DNA short-read aligner for WGS and WGBS reads. With
high throughput (~1.5 to 2 million reads per second with the human reference
genome in a 4-GPU computer), it is well suited to large-scale NGS data
processing.

### [Bowtie](https://bowtie-bio.sf.net)

An ultrafast, memory-efficient short read aligner that aligns short DNA
sequences to the human genome at a rate of about 25 million reads per hour on a
typical desktop computer. Bowtie indexes the genome with a Burrows-Wheeler index
to keep its memory footprint small: 2.3 GB for the human genome. Bowtie and
Bowtie2 were developed by Ben Langmead and are actively supported by his lab.

### [Tophat](/_/legacy/tophat/index.html)

A spliced alignment system for RNA-seq experiments. TopHat finds known and novel
exon-exon splice junctions and is extremely fast due to its use of the Bowtie2
aligner. The last release, TopHat2, runs with either Bowtie1 or Bowtie2 and
includes algorithms that significant enhance TopHat's sensitivity, particularly
in the presence of pseudogenes. TopHat2 includes TopHat-Fusion as an option.
TopHat2 includes TopHat-Fusion as an option.

### [TopHat-Fusion](https://tophat-fusion.sourceforge.net)

TopHat-Fusion is an enhanced version of TopHat with the ability to align reads
across fusion points, which results from the breakage and re-joining of two
different chromosomes, or from rearrangements within a chromosome.

### [HISAT](/hisat/index)

HISAT is a highly efficient system for aligning RNA-seq reads. HISAT uses a
novel indexing scheme, hierarchical indexing, which is inherently well-suited
for aligning across introns. It employs two types of indexes for alignment: (1)
a whole-genome FM index to anchor each alignment, and (2) numerous local FM
indexes for very rapid extensions of these alignments. HISAT supports genomes of
any size, including those larger than 4 billion bases.

### [HISAT2](/hisat2/index)

HISAT2 is a new, rapid and accurate system for aligning NGS reads (both DNA and
RNA) against a population of genomes. HISAT2 is a successor to both HISAT and
TopHat2. HISAT2 extends the Burrows-Wheeler transform (BWT) and the
Ferragina-Manzini (FM) index to incorporate genomic differences among
individuals into the reference genome. HISAT2 is currently maintained at
[kim-lab.org](https://kim-lab.org/).

### [HISAT-genotype](/hisat-genotype/index)

HISAT-genotype is a next-generation platform that enables rapid and accurate
genomic analysis of our genomes using next-generation sequencing data on a
desktop within a few hours. The platform currently supports HLA typing,
discovery of novel HLA alleles, DNA fingerprinting analysis, and other
functionalities. All HISAT programs were developed by Daehwan Kim and they are
currently maintained at [kim-lab.org](https://kim-lab.org/).


### [TieBrush](https://github.com/alevar/tiebrush)

A utility for efficient merging redundant information from multiple alignment
files designed to enable rapid manupulation of extremely large datasets
(RNA-seq, whole genome, exome, etc.). Data representations built with TieBrush
and TieCov can be used for easier programmatic and visual analysis and
comparison of groups within large sequencing datasets.

### [EASTR](/eastr/index)

EASTR is a tool for detecting spuriously spliced alignments and junctions in
RNA-seq datasets and reference annotations. It improves the accuracy of
downstream analyses, such as transcriptome assembly, by dentifying and removing
misaligned spliced alignments. The tool can process GTF, BED, and BAM files as
input.


### [CloudBurst](https://cloudburst-bio.sf.net)

An older program for highly sensitive short read mapping using MapReduce.
CloudBurst, developed by Michael Schatz (now a faculty member at JHU Computer
Science) uses [Hadoop](https://hadoop.apache.org) to efficiently parallelize the
short read mapping problem to dozens or hundreds of computers. This enables
CloudBurst to execute highly sensitive read mappings with any number of
mutations or indels.

### [Crossbow](https://bowtie-bio.sf.net/crossbow)

Crossbow is an early scalable software pipeline for whole genome resequencing
analysis. It combines [Bowtie](https://bowtie-bio.sf.net), an ultrafast and
memory efficient short read aligner, and
[SoapSNP](https://soap.genomics.org.cn/soapsnp.html), an accurate genotyper,
within [Hadoop](https://hadoop.apache.org) to distribute and accelerate the
computation with many nodes. In
[the CrossBow paper](https://genomebiology.com/2009/10/11/R134), we used it to
analyze 35x coverage of a human genome in 3 hours for about $100 using a
40-node, 320-core cluster rented from [Amazon's EC2](https://aws.amazon.com)
utility computing service.

### [Diamund](/diamund/index)

Diamund is an efficient algorithm for variant detection in family trios or pairs
of closely related exome or whole-genome sequencing samples. It compares DNA
sequences directly to one another, without aligning them to the reference
genome.

### [EDGE-pro](/EDGE-pro/index)

EDGE-pro is a program for estimating gene expression from prokaryotic RNA-seq.
EDGE-pro uses Bowtie2 for alignment but, unlike TopHat and Cufflinks, does not
allow spliced alignments. It also handles overlapping genes, a common phenomenon
in bacteria that is largely absent in eukaryotes.
