# Software

## MaSuRCA genome assembler

[MaSuRCA](http://github.com/alekseyzimin/masurca/) is a high quality assembly software for Illumina only or hybrid Illumina + PacBio/Oxford Nanopore data sets. It is capable of producing asemblies of very large and complex genomes such as 22Gbp genome of Loblolly pine or 16 Gbp genome of bread wheat.  
POLCA polisher and SAMBA scaffolder are distributed with MaSuRCA assembler.

## MUMmer4

[MUMmer4](https://mummer4.github.io/) is a substantially improved version of popular MUMmer3 software that addresses input sequence size constraints present in MUMmer3 by changing the 32-bit suffix tree data structure at the core of MUMmer to a 48-bit suffix array, and that offers improved speed through parallel processing of input query sequences. With a theoretical limit on the input size of 141Tbp, MUMmer4 can now work with input sequences of any biologically realistic length.

## EviAnn automated eukaryotic genome annotation software

[EviAnn (Evidence Annotation)](http://github.com/alekseyzimin/EviAnn_release/) is a novel annotation software. EviAnn does not use any de novo gene finders in its processing. It is purely evidence-based. EviAnn uses RNAseq data and/or transcripts, and proteins from related species as inputs. EviAnn produces annotation of protein coding genes and transcripts, and outputs it in GFF3 format. EviAnn does not require genome repeats to be soft-masked prior to running annotation. EviAnn is stable and fast. Annotation of A.thaliana genome takes about 2 hours on a single 32-64 core server (not including time for aligning RNAseq reads, which could vary depending on the amount of data used.)

## KrakenUniq

I am not the original author of KrakenUniq. I helped with developing version 0.7.0 and onward. I currently maintain the code to fix bugs and make small improvements. The new versions allow KrakenUniq to run on standard laptops and desktops with as little as 16GB of RAM using the --preload-size option.

[KrakenUniq](https://github.com/fbreitwieser/krakenuniq) (formerly KrakenHLL) is a novel metagenomics classifier that combines the fast k-mer-based classification of Kraken with an efficient algorithm for assessing the coverage of unique k-mers found in each species in a dataset. On various test datasets, KrakenUniq gives better recall and precision than other methods and effectively classifies and distinguishes pathogens with low abundance from false positives in infectious disease samples. By using the probabilistic cardinality estimator HyperLogLog, KrakenUniq runs as fast as Kraken and requires little additional memory.

## My github repositories

All software titles that I develop and maintain are publicly available under an open-source license. They are available from my [github account](https://github.com/alekseyzimin).

