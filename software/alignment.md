(alignment)=
# Alignment 


(bowtie)=
## 1. [Bowtie](https://bowtie-bio.sourceforge.net/index.shtml)

An ultrafast, memory-efficient short read aligner that aligns short DNA sequences to the human genome at a rate of about 25 million reads per hour on a typical desktop computer. Bowtie indexes the genome with a Burrows-Wheeler index to keep its memory footprint small: 2.3 GB for the human genome. Bowtie and Bowtie2 were developed by Ben Langmead and are actively supported by his lab.

**Categories:** alignment  
**Publication:** [PMC2690996](https://pmc.ncbi.nlm.nih.gov/articles/PMC2690996/)



(hisat)=
## 2. [HISAT](https://github.com/DaehwanKimLab/hisat/wiki)

HISAT is a highly efficient system for aligning RNA-seq reads. HISAT uses a novel indexing scheme, hierarchical indexing, which is inherently well-suited for aligning across introns. It employs two types of indexes for alignment: (1) a whole-genome FM index to anchor each alignment, and (2) numerous local FM indexes for very rapid extensions of these alignments. HISAT supports genomes of any size, including those larger than 4 billion bases.

**Categories:** alignment  
**Publication:** [PMC4655817](https://pmc.ncbi.nlm.nih.gov/articles/PMC4655817/)



(hisat2)=
## 3. [HISAT2](https://daehwankimlab.github.io/hisat2/)

HISAT2 is a new, rapid and accurate system for aligning NGS reads (both DNA and RNA) against a population of genomes. HISAT2 is a successor to both HISAT and TopHat2. HISAT2 extends the Burrows-Wheeler transform (BWT) and the Ferragina-Manzini (FM) index to incorporate genomic differences among individuals into the reference genome. HISAT2 is currently maintained at https://kim-lab.org/.

**Categories:** alignment  
**Publication:** [PMC7605509](https://pmc.ncbi.nlm.nih.gov/articles/PMC7605509/)



(hisat-genotype)=
## 4. [HISAT-genotype](https://daehwankimlab.github.io/hisat-genotype/)

HISAT-genotype is a next-generation platform that enables rapid and accurate genomic analysis of our genomes using next-generation sequencing data on a desktop within a few hours. The platform currently supports HLA typing, discovery of novel HLA alleles, DNA fingerprinting analysis, and other functionalities. All HISAT programs were developed by Daehwan Kim and are currently maintained at https://kim-lab.org/.

**Categories:** alignment  
**Publication:** [PMC7605509](https://pmc.ncbi.nlm.nih.gov/articles/PMC7605509/)



(arioc)=
## 5. [Arioc](https://github.com/rwilton/arioc)

Arioc is a GPU-accelerated DNA short-read aligner for WGS and WGBS reads. With high throughput (~1.5 to 2 million reads per second with the human reference genome in a 4-GPU computer), it is well suited to large-scale NGS data processing.

**Categories:** alignment  
**Publication:** [PMC4358639](https://pmc.ncbi.nlm.nih.gov/articles/PMC4358639/)



(tophat)=
## 6. [TopHat](https://github.com/DaehwanKimLab/tophat/wiki)

A spliced alignment system for RNA-seq experiments. TopHat finds known and novel exon-exon splice junctions and is extremely fast due to its use of the Bowtie2 aligner. The last release, TopHat2, runs with either Bowtie1 or Bowtie2 and includes algorithms that significantly enhance TopHat's sensitivity, particularly in the presence of pseudogenes. TopHat2 includes TopHat-Fusion as an option.

**Categories:** alignment  
**Publication:** [PMC2672628](https://pmc.ncbi.nlm.nih.gov/articles/PMC2672628/)



(tophat-fusion)=
## 7. [TopHat-Fusion](https://github.com/DaehwanKimLab/tophat/wiki/Fusion-Home)

TopHat-Fusion is an enhanced version of TopHat with the ability to align reads across fusion points, which results from the breakage and re-joining of two different chromosomes, or from rearrangements within a chromosome.

**Categories:** alignment  
**Publication:** [PMC3245612](https://pmc.ncbi.nlm.nih.gov/articles/PMC3245612/)



(cloudburst)=
## 8. [CloudBurst](https://cloudburst-bio.sf.net)

An older program for highly sensitive short read mapping using MapReduce. CloudBurst, developed by Michael Schatz (now a faculty member at JHU Computer Science), uses Hadoop to efficiently parallelize the short read mapping problem to dozens or hundreds of computers. This enables CloudBurst to execute highly sensitive read mappings with any number of mutations or indels.

**Categories:** alignment  
**Publication:** [PMC2682523](https://pmc.ncbi.nlm.nih.gov/articles/PMC2682523/)



(crossbow)=
## 9. [Crossbow](https://bowtie-bio.sourceforge.net/crossbow/index.shtml)

Crossbow is an early scalable software pipeline for whole genome resequencing analysis. It combines Bowtie, an ultrafast and memory efficient short read aligner, and SoapSNP, an accurate genotyper, within Hadoop to distribute and accelerate the computation with many nodes. In the CrossBow paper, we used it to analyze 35x coverage of a human genome in 3 hours for about $100 using a 40-node, 320-core cluster rented from Amazon's EC2 utility computing service.

**Categories:** alignment  
**Publication:** [PMC3091327](https://pmc.ncbi.nlm.nih.gov/articles/PMC3091327/)



