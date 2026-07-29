## Metagenomics Classification, Abundance Estimation and Visualization

<!-- Newer Software -->

## [Bolotie](https://github.com/salzberg-lab/bolotie)

Bolotie enables rapid detection of inter-clade recombination in SARS-CoV-2.
[See the paper here](https://pmc.ncbi.nlm.nih.gov/articles/PMC8194586/).

<!------------------------>

### [How to Choose a Metagenomics Classifier](https://github.com/dpuiu/choosing-a-metagenomics-classifier/wiki)

Kraken, KrakenUniq, Kraken2, and Centrifuge are all metagenomic classifiers
developed by researchers in the Center for Computational Biology. To help users
choose the best tool for their project, we provide this linked page as an
explanation and comparison between tools along with descriptions of each author
and their roles in the software development.

### [Kraken](https://github.com/dpuiu/kraken/wiki) <!--(https://github.com/DerrickWood/kraken/wiki)-->

Kraken is a very fast system for taxonomic classification of short or long DNA
sequences from a microbiome or metagenomic sample.
[See the 2014 Genome Biology paper here](https://genomebiology.com/2014/15/3/R46/abstract).
NOTE: KrakenUniq is a newer, more capable version of Kraken1, and we strongly
recommend that users upgrade to KrakenUniq or else Kraken2.
	
### [KrakenUniq](https://github.com/fbreitwieser/krakenuniq/wiki)

KrakenUniq is update to Kraken 1 that runs as fast as Kraken and can work with
the same databases, but additionally counts the number of unique k-mers using
the stream sketching algorithm HyperLogLog. Using unique k-mers, the results can
be filtered and ranked by the coverage of genomes in the database, instead of
simple read counts. NEW! (May 2022): KrakenUniq has a new version developed by
Christopher Pockrandt that can run on low-memory machines, including laptops,
even with a huge database (hundreds of GB). It's also available for installation
using bioconda, at <https://anaconda.org/bioconda/krakenuniq>.

### [Kraken2](https://github.com/DerrickWood/kraken2/wiki)

Kraken2 is an improved version of Kraken, using the same classification
algorithm but with improvements in speed and memory. Specifically, Kraken 2 have
faster database build times, smaller database sizes, and faster classification
speeds. Additional details are explained on the Kraken 2 webpage.

### [Centrifuge](https://github.com/dpuiu/centrifuge/wiki) <!--(https://github.com/DaehwanKimLab/centrifuge/wiki)-->

Centrifuge is a very rapid and memory-efficient system for the classification of
DNA sequences from microbial samples, with better sensitivity than and
comparable accuracy to other leading systems. Centrifuge requires a relatively
small index (e.g., 4.3 GB for ~4,100 bacterial genomes).

### [Bracken](https://github.com/dpuiu/Bracken/wiki) <!--(https://github.com/jenniferlu717/Bracken/wiki)-->

Bracken statistical method that computes the abundance of species in DNA
sequences from a metagenomics sample.

### [Pavian](https://github.com/dpuiu/pavian/wiki) <!--(https://github.com/fbreitwieser/pavian/wiki)-->

Pavian is a web application for exploring metagenomics classification results,
with a special focus on infectious disease diagnosis.

### [KrakenTools](https://github.com/dpuiu/krakentools/wiki) <!--https://github.com/jenniferlu717/KrakenTools-->

KrakenTools is a suite of scripts to be used alongside the Kraken, KrakenUniq, Kraken 2, or Bracken programs. 
These scripts are designed to help Kraken users with downstream analysis of Kraken results.
