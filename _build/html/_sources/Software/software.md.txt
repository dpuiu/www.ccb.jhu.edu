# Packages

**If you're looking for the CHESS human gene database, it is at [ccb.jhu.edu/chess](http://ccb.jhu.edu/chess)**

## Next-generation sequence alignment software

[**Arioc**](https://github.com/rwilton/arioc)

Arioc is a GPU-accelerated DNA short-read aligner for WGS and WGBS
reads. With high throughput (~1.5 to 2 million reads per second with
the human reference genome in a 4-GPU computer), it is well suited to
large-scale NGS data processing.

[**Bowtie**](http://bowtie-bio.sf.net)

An ultrafast, memory-efficient short read aligner that aligns short DNA
sequences to the human genome at a rate of about 25 million reads per
hour on a typical desktop computer. Bowtie indexes the genome with a
Burrows-Wheeler index to keep its memory footprint small: 2.3 GB for the
human genome. Bowtie and Bowtie2 were developed by Ben Langmead and are
actively supported by his lab.

[**TopHat**](/software/tophat)

A spliced alignment system for RNA-seq experiments. TopHat finds known
and novel exon-exon splice junctions and is extremely fast due to its
use of the Bowtie2 aligner. The last release, TopHat2, runs with either
Bowtie1 or Bowtie2 and includes algorithms that significant enhance
TopHat's sensitivity, particularly in the presence of pseudogenes.
TopHat2 includes TopHat-Fusion as an option.
TopHat2 includes TopHat-Fusion as an option.

[**TopHat-Fusion**](http://tophat-fusion.sourceforge.net)

TopHat-Fusion is an enhanced version of TopHat with the ability to align
reads across fusion points, which results from the breakage and
re-joining of two different chromosomes, or from rearrangements within a
chromosome.

[**HISAT**](/software/hisat)

HISAT is a highly efficient system for aligning RNA-seq reads. HISAT
uses a novel indexing scheme, hierarchical indexing, which is inherently
well-suited for aligning across introns. It employs two types of indexes
for alignment: (1) a whole-genome FM index to anchor each alignment, and
(2) numerous local FM indexes for very rapid extensions of these
alignments. HISAT supports genomes of any size, including those larger
than 4 billion bases.

[**HISAT2**](/software/hisat2)

HISAT2 is a new, rapid and accurate system for aligning NGS reads (both
DNA and RNA) against a population of genomes. HISAT2 is a successor to
both HISAT and TopHat2. HISAT2 extends the Burrows-Wheeler transform
(BWT) and the Ferragina-Manzini (FM) index to incorporate genomic
differences among individuals into the reference genome. HISAT2 is
currently maintained at [kim-lab.org](https://kim-lab.org/).

[**HISAT-genotype**](hisat-genotype)

HISAT-genotype is a next-generation platform that enables rapid and
accurate genomic analysis of our genomes using next-generation
sequencing data on a desktop within a few hours. The platform currently
supports HLA typing, discovery of novel HLA alleles, DNA fingerprinting
analysis, and other functionalities. All HISAT programs were developed
by Daehwan Kim and they are currently maintained at
[kim-lab.org](https://kim-lab.org/).

[**Cufflinks**](http://cole-trapnell-lab.github.io/cufflinks/)

A transcript assembler and abundance estimator for RNA-seq data.
Cufflinks assembles transcripts from the alignments produced by TopHat,
including novel isoforms, and quantitates those transcripts. Cufflinks
was originally developed by Cole Trapnell and is supported by his lab at
the University of Washington.

[**StringTie**](http://ccb.jhu.edu/software/stringtie)

A fast and accurate transcript assembler and abundance estimator for
RNA-seq data. Designed as a successor to Cufflinks, StringTie assembles
transcripts from the alignments produced by TopHat2, HISAT, or other
spliced aligners, and quantitates those transcripts.

[**TieBrush**](https://github.com/alevar/tiebrush)

A utility for efficient merging redundant information from multiple
alignment files designed to enable rapid manupulation of extremely large
datasets (RNA-seq, whole genome, exome, etc.). Data representations
built with TieBrush and TieCov can be used for easier programmatic and
visual analysis and comparison of groups within large sequencing
datasets.

[**EASTR**](https://ccb.jhu.edu/eastr/)

EASTR is a tool for detecting spuriously spliced alignments and
junctions in RNA-seq datasets and reference annotations. It improves the
accuracy of downstream analyses, such as transcriptome assembly, by
dentifying and removing misaligned spliced alignments. The tool can
process GTF, BED, and BAM files as input.

[**Ballgown**](https://github.com/alyssafrazee/ballgown)

A program for computing differentially expressed genes in two or more
RNA-seq experiments, using the output of StringTie or Cufflinks. The
Ballgown package provides functions to organize, visualize, and analyze
expression measurements. Ballgown is written in R and is part of
Bioconductor.

[**CloudBurst**](http://cloudburst-bio.sf.net)

An older program for highly sensitive short read mapping using
MapReduce. CloudBurst, developed by Michael Schatz (now a faculty member
at JHU Computer Science) uses [Hadoop](http://hadoop.apache.org) to
efficiently parallelize the short read mapping problem to dozens or
hundreds of computers. This enables CloudBurst to execute highly
sensitive read mappings with any number of mutations or indels.

[**Crossbow**](http://bowtie-bio.sf.net/crossbow)

Crossbow is an early scalable software pipeline for whole genome
resequencing analysis. It combines [Bowtie](http://bowtie-bio.sf.net),
an ultrafast and memory efficient short read aligner, and
[SoapSNP](http://soap.genomics.org.cn/soapsnp.html), an accurate
genotyper, within [Hadoop](http://hadoop.apache.org) to distribute and
accelerate the computation with many nodes. In [the CrossBow
paper](http://genomebiology.com/2009/10/11/R134), we used it to analyze
35x coverage of a human genome in 3 hours for about $100 using a
40-node, 320-core cluster rented from [Amazon's EC2](http://aws.amazon.com) utility computing service.

[**Diamund**](/software/diamund/index.shtml)

Diamund is an efficient algorithm for variant detection in family trios
or pairs of closely related exome or whole-genome sequencing samples. It
compares DNA sequences directly to one another, without aligning them to
the reference genome.

[**EDGE-pro**](/software/EDGE-pro/index.shtml)

EDGE-pro is a program for estimating gene expression from prokaryotic
RNA-seq. EDGE-pro uses Bowtie2 for alignment but, unlike TopHat and
Cufflinks, does not allow spliced alignments. It also handles
overlapping genes, a common phenomenon in bacteria that is largely
absent in eukaryotes.

## Metagenomics Classification, Abundance Estimation and Visualization

[**How to Choose a Metagenomics Classifier**](/software/choosing-a-metagenomics-classifier/)

Kraken, KrakenUniq, Kraken2, and Centrifuge are all metagenomic
classifiers developed by researchers in the Center for Computational
Biology. To help users choose the best tool for their project, we
provide this linked page as an explanation and comparison between tools
along with descriptions of each author and their roles in the software
development.

[**Kraken**](/software/kraken/)

Kraken is a very fast system for taxonomic classification of short or
long DNA sequences from a microbiome or metagenomic sample. [See the
2014 Genome Biology paper
here](http://genomebiology.com/2014/15/3/R46/abstract). NOTE: KrakenUniq
is a newer, more capable version of Kraken1, and we strongly recommend
that users upgrade to KrakenUniq or else Kraken2.

[**KrakenUniq**](https://github.com/fbreitwieser/krakenuniq)

KrakenUniq is update to Kraken 1 that runs as fast as Kraken and can
work with the same databases, but additionally counts the number of
unique k-mers using the stream sketching algorithm HyperLogLog. Using
unique k-mers, the results can be filtered and ranked by the coverage of
genomes in the database, instead of simple read counts. NEW! (May 2022):
KrakenUniq has a new version developed by Christopher Pockrandt that can
run on low-memory machines, including laptops, even with a huge database
(hundreds of GB). It's also available for installation using bioconda,
at <https://anaconda.org/bioconda/krakenuniq>.

[**Kraken2**](/software/kraken2/)

Kraken2 is an improved version of Kraken, using the same classification
algorithm but with improvements in speed and memory. Specifically,
Kraken 2 have faster database build times, smaller database sizes, and
faster classification speeds. Additional details are explained on the
Kraken 2 webpage.

[**Centrifuge**](/software/centrifuge/)

Centrifuge is a very rapid and memory-efficient system for the
classification of DNA sequences from microbial samples, with better
sensitivity than and comparable accuracy to other leading systems.
Centrifuge requires a relatively small index (e.g., 4.3 GB for ~4,100
bacterial genomes).

[**Bracken**](/software/bracken/)

Bracken statistical method that computes the abundance of species in DNA
sequences from a metagenomics sample.

[**Pavian**](/software/pavian/)

Pavian is a web application for exploring metagenomics classification
results, with a special focus on infectious disease diagnosis.

## Computational Gene Finding

[**Glimmer**](/software/glimmer/index.shtml)

A system that uses interpolated Markov models to find genes in microbial
DNA. Used to annotate hundreds (possibly thousands) of bacterial,
archaeal, and viral genomes. Current version is 3.02.

[**GlimmerHMM**](/software/glimmerhmm/)

A Generalized Hidden Markov Model gene-finder which makes use of the
techniques implemented previously by GlimmerM.

[**Glimmer-MG**](/software/glimmerhmm/)

Glimmer-MG is a older system for finding genes in metagenomic shotgun
DNA sequences, using the Glimmer algorithm plus the SCIMM system for
clustering metagenomics data, and the now-outdated Phymm system for
phylogenetic labeling.

[**GeneSplicer**](/software/genesplicer/)

A fast system for detecting splice sites in genomic DNA of various
eukaryotes.

[**SIM4CC**](/software/sim4cc/)

An accurate and efficient program to align cDNA sequences (mRNAs, ESTs)
to genomic sequences, specifically designed for cross-species alignment.

[**sim4db / leaff**](http://sourceforge.net/projects/kmer/)

Fast high-throughput [spliced
alignment](http://bioinformatics.oxfordjournals.org/content/27/13/1869)
(sim4, sim4cc) and sequence indexing.

[**ASprofile**](/software/ASprofile/index.shtml)

A suite of programs for extracting, quantifying and comparing
alternative splicing (AS) events from RNA-seq data.

[**JIGSAW**](/software/jigsaw/index.shtml)

A program that predicts gene models using the output from multiple
sources of evidence, including other gene finders, Blast searches, and
other alignment data.

## Genome assembly and large-scale genome alignment

[**MUMmer**](http://mummer.sourceforge.net/)

A system for aligning whole genomes, chromosomes, and other very long
DNA sequences. MUMmer is also widely used for comparing genome
assemblies. NOTE: MUMmer has been at sourceforge since the early
2000's, but was moved to Github with the release of MUMmer4 in 2017.

[**MUMmerGPU**](http://mummergpu.sourceforge.net/)

An early attempt to use GPUs for alignment, MUMmerGPU uses a technique
called general-purpose GPU programming (GPGPU programming) to harness
the extreme parallelism of GPUs for non-graphics tasks.

[**GAGE**](http://gage.cbcb.umd.edu/)

A realistic assessment of genome assembly software in a rapidly changing
field of next-generation sequencing.

[**GAGE-B**](http://ccb.jhu.edu/gage_b/)

An evaluation of contiguity and accuracy of assemblies of bacterial
organisms that are generated by some of most commonly used genome
assemblers. GAGE-B follows the standards set by GAGE.

[**MaSuRCA**](http://masurca.blogspot.com/)

MaSuRCA is a whole-genome assembler developed originally at the
University of Maryland by James Yorke, Aleksey Zimin, and their
colleagues. Ongoing development is a joint effort between JHU and UMD,
and with recent modules designed to create hybrid assemblies using both
short reads (Illumina) and long reads (PacBio/Oxford Nanopore).

[**AMOS Assembler project**](http://amos.sourceforge.net/)

This is a set of tools, libraries, and freestanding genome assemblers,
all open source. AMOS is an open consortium started at The Institute for
Genomic Research (TIGR) that grew to include the University of Maryland,
Johns Hopkins University, The Karolinska Institutet, the Marine
Biological Laboratory, and others

[**AMOScmp**](http://amos.sourceforge.net/docs/pipeline/AMOScmp.html)

Is a comparative genome assembler, which uses one genome as a reference
on which to assemble another, closely related species.  See the 
[journal paper here](http://ccb.jhu.edu/people/salzberg/docs/AMOScmp-reprint.pdf).

[**MINIMUS**](http://amos.sourceforge.net/docs/pipeline/minimus.html)

A small, lightweight assembler for small jobs such as assembling a viral
genome, assembling a set of reads that match a single gene, or other
tasks that don't require the complex infrastructure of a large-genome
assembler.

[**Hawkeye**](http://amos.sourceforge.net/hawkeye/)

A visual analytics tool for genome assembly analysis and validation,
designed to aid in identifying and correcting assembly errors. All
levels of the assembly data hierarchy are made accessible to users,
along with summary statistics and common assembly metrics. A ranking
component guides investigation towards likely mis-assemblies or
interesting features to support the task at hand. Can be used to
interactively analyze assemblies from many popular assemblers on your
desktop computer. [See the journal paper here.](http://genomebiology.com/2007/8/3/R34)

[**Quake**](/software/quake/index.shtml)

A software package to detect and correct substitution sequencing errors
in WGS data sets with deep coverage.

[**FLASH**](http://ccb.jhu.edu/software/FLASH/index.shtml)

A fast, accurate program to increase the length of reads by overlapping
and merging paired reads from fragments shorter than twice the length of
reads. Primarily designed to merge Illumina paired reads.

[**Celera Assembler**](http://wgs-assembler.sourceforge.net)

A whole genome assembler originally developed at Celera Genomics for the
assembly of the human genome.  CeleraAssembler is an open-source project
at SourceForge.  The code has been actively maintained since 2005 by
researchers at [CBCB](http://www.cbcb.umd.edu) and the [Venter
Institute](http://www.venterscience.org) (formerly known as TIGR, The
Institute for Genomic Research).

[**ABBA**](http://amos.sourceforge.net/docs/pipeline/abba.html)

**A**ssembly **B**oosted **B**y **A**mino acid sequence is a comparative
gene assembler, which uses amino acid sequences from predicted proteins
to help build a better assembly.  See the [journal
paper.](http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1000186)
[Link for installation and more
information.](http://amos.sourceforge.net/docs/pipeline/abba.html).

[**AutoEditor**](http://sourceforge.net/apps/mediawiki/amos/index.php?title=AutoEditor)

A tool for correcting sequencing and basecaller errors using sequence
assembly and chromatogram data from Sanger (1st generation) reads. On
average, AutoEditor corrects 80% of erroneous base calls, with an
accuracy of 99.99%.

## Other sequence analysis tools

[**BRCA gene testing**](http://ccb.jhu.edu/software/BRCA-diagnostic/index.shtml)

A computational screening test that takes the raw DNA sequence data from
a whole-genome sequence of an individual human and tests for each of 68
known mutations in the BRCA1 and BRCA2 genes.

[**DivE**](/software/dive/index.shtml)

A software to find regions that evolve at a slower or faster rate than
the neutral evolution rate in any clade of a phylogeny of a set of very
closely related species.

[**DupLoCut**](/software/duplocut/index.shtml)

A software which computes ancestral gene orders under the
duplication-loss evolutionary model.

[**ELPH**](http://ccb.jhu.edu/software/ELPH/index.shtml)

A motif finder based on Gibbs sampling that can find ribosome binding
sites, exon splicing enhancers, or regulatory sites.

[**fqtrim**](/software/fqtrim/index.shtml)

A software utility for filtering and trimming high-throughput next-gen
reads.

[**GFF utilities**](/software/stringtie/gff.shtml)

[gffread](/software/stringtie/gff.shtml#gffread): 

A program for filtering, converting and manipulating GFF files
:::

[gffcompare](/software/stringtie/gffcompare.shtml): a program for
comparing, annotating, merging and tracking transcripts in GFF files
:::

[**Insignia**](http://insignia.cbcb.umd.edu/)

A comprehensive system for finding unique DNA sequences that can be used
to identify any bacterial or virus species or strain. Currently has over
13,000 species and strains in its database..

[**Kraken**](/software/kraken/)

A fast system for taxonomic classification of short or long metagenomic
DNA sequences.

[**Centrifuge**](/software/centrifuge/)

A very rapid and memory-efficient system for the classification of DNA
sequences from microbial samples.

[**PhymmBL**](/software/phymmbl/index.shtml)

A one-stop system for taxonomically classifying metagenomic short reads.

[**rddChecker**](http://ccb.jhu.edu/software/rddChecker/index.shtml)

A program for determining sites of RNA-DNA differences (RDDs) and
candidate RNA editing sites from RNA-seq data.

[**RepeatFinder**](http://www.cbcb.umd.edu/software/RepeatFinder/)

an older system for finding and characterizing repetitive sequences in
complete and partial genomes.

[**Scimm**](http://www.cbcb.umd.edu/software/scimm)

A tool for unsupervised clustering of metagenomic sequences using
interpolated Markov models.

[**SEE ESE**](http://ccb.jhu.edu/software/SeeEse/index.shtml)

an online tool for identifying exon splicing enhancers (ESEs) in
Arabidopsis and Drosophila.

[**TransTermHP**](http://transterm.ccb.jhu.edu/)

A highly accurate program that finds rho-independent transcription
terminators in bacterial genomes. The site includes a database with
pre-computed predictions for hundreds of species.

## Variant Analysis Tools

[**CHASM and SNVBox**](http://wiki.chasmsoftware.org/)

Software to predict the functional sigificance of somatic missense
mutations observed in the genomes of cancer cells, and a database of
pre-computed features of all possible amino acid substitutions at every
position of the annotated human exome.

[**CRAVAT**](http://www.cravat.us/)

Cancer-related analysis of variants toolkit. Web tool for functional
predictions and annotations of both somatic and germline variants.

[**FAST**](https://bitbucket.org/baderlab/fast/wiki/Home)

An application for genome-wide studies by efficiently running several
gene based analysis methods simultaneously on the same data set.

[**LS-SNP/PDB**](http://ls-snp.icm.jhu.edu/)

Web tool for structural annotations and visualizations of missense
variants in dbSNP.

[**muPIT**](http://mupit.icm.jhu.edu/)

Web tool for interactive structural annotations and visualizations of
non-synonymous variation/mutation on proeins.

## Other web servers and databases

[**CHESS**](http://ccb.jhu.edu/chess/)

A new catalog of human genes based on nearly 10,000 RNA sequencing
experiments. For a full description of chess, see the paper in *Genome
Biology*,
[here](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-018-1590-2).

[**T2T-CHM13 Annotation**](https://ccb.jhu.edu/T2T.shtml)

RefSeq annotation of the CHM13 genome created using the Liftoff program

[**ARDB**](http://ardb.cbcb.umd.edu/)

**New in early 2009** Antibiotic Resistance Genes Database

**[**EnteriX**](http://enterix.cbcb.umd.edu/)**

Web servers for displaying alignments and annotations of bacterial genomes. 

[A collection of links (now very old) to external sequence analysis programs.](http://cbcb.umd.edu/%7Esalzberg/appendixa.html)
