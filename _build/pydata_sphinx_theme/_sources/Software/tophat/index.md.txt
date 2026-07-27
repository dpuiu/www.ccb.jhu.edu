# TopHat

```{contents}
:local:
:depth: 1
:hidden:
```

## About

**TopHat** is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq
reads to mammalian-sized genomes using the ultra high-throughput short read
aligner [Bowtie](http://bowtie-bio.sourceforge.net), and then analyzes the
mapping results to identify splice junctions between exons.\
![Open Source Software](/_static/osi-certified.gif)

TopHat is a collaborative effort among Daehwan Kim and Steven Salzberg in the
[Center for Computational Biology](http://ccb.jhu.edu) at Johns Hopkins
University, and Cole Trapnell in the
[Genome Sciences Department](http://www.gs.washington.edu/faculty/trapnell.htm)
at the University of Washington. TopHat was originally developed by Cole
Trapnell at the
[Center for Bioinformatics and Computational Biology](http://cbcb.umd.edu) at
the University of Maryland, College Park.

### TopHat 2.1.1 release 2/23/2016

Please note that TopHat has entered a low maintenance, low support stage as it
is now largely superseded by [**HISAT2**](http://ccb.jhu.edu/software/hisat2)
which provides the same core functionality (i.e. spliced alignment of RNA-Seq
reads), in a more accurate and **much more efficient** way. Version 2.1.1 is a
maintenance release which includes the following changes, some of them thanks to
[GitHub](https://github.com/infphilo/tophat) contributors:

- TopHat can be now built on more recent Linux distributions with newer GNU C++
  (5.x), as the included SeqAn library was finally upgraded to a newer version.
- improved the detection of linker options for the Boost::Thread library which
  prevented the TopHat build from source on some systems.
- incorporated Luca Venturini's code to support large bowtie2 indexes (.bt2l).
- `bam2fastx` usage message (-h/--help) was updated in order to better document
  the functions of this program which can be used as a standalone utility for
  converting reads from BAM/SAM to FASTQ/FASTA; the -v/--version option was also
  added to this utility for easier integration in other pipelines.

### TopHat 2.1.0 release 6/29/2015

- TopHat-Fusion algorithm improvements for more sensitive and accurate discovery
  of fusions, thanks to contributions from Gordon Bean and Ryan Kelley at
  Illumina.
  - This release implements a new algorithm for counting fusion-supporting read
    pairs that reduces the number of false-positive potential fusions. This
    algorithm computes the inner distance between read pairs by first converting
    the pair positions to transcript coordinates using the transcript
    information in refGene.txt and ensGene.txt. Pairs with small inner distance
    (suggesting the pair could come from a plausible pair-end insert) are
    counted as supporting evidence for the fusion. The default threshold for the
    inner distance is 250 base pairs; this parameter can be set using the
    `--fusion-pair-dist <int>` flag.
- fixed a few issues with GFF parsing of some annotation files
- fixed a runtime-error when using --no-discordant option.

Several fixes/improvements thanks to contributors on GitHub:

- new `--max-num-fusions` option allowing the user to specify the maximum number
  of reported fusions in tophat-fusion-post
- adjusting lower limit for `--fusion-multipairs`
- fixed a few typos, cleaning up python code etc.

### TopHat source code moved to [GitHub](https://github.com/infphilo/tophat) 3/31/2015

TopHat is now available as a public GitHub repository where users are welcome to
submit bug reports (issues) and developers are encouraged to submit patches
(pull requests).

### TopHat 2.0.14 release 3/24/2015

Version 2.0.14 is a maintenance release with the following changes:

- pipeline speed improvements thanks to contributions from Véronique Legrand and
  Michaël Pressigout of Institut Pasteur
- added support for xz compressed read files (thanks to a patch submitted by
  Ashton Trey Belew)
- applied a couple of Python fixes to prevent potential issues with package
  handling and some file operations
- fixed a potential linking issue where the wrong libbam.a library could have
  been linked when building from source

### TopHat 2.0.13 release 10/2/2014

Version 2.0.13 is a maintenance release with the following changes:

- removed SAMtools as an *external* dependency in order to avoid incompatibility
  issues with recent and future changes of SAMtools and its code library (an
  older, stable SAMtools version is now packaged with TopHat)
- fixed a few code compatibility issues when compiling on OSX 10.9

### TopHat 2.0.12 release 6/24/2014

Version 2.0.12 is a maintenance release with the following simple fix:

- This version is compatible with Bowtie2 v2.2.3.

### TopHat 2.0.11 release 3/4/2014

Version 2.0.11 is a maintenance release with the following simple fix:

- This version is compatible with Bowtie2 v2.2.1, although it does not support a
  64-bit Bowtie2 index yet.

### TopHat 2.0.10 release 11/13/2013

Version 2.0.10 is a maintenance release with the following fixes and changes:

- Improved support for adding unpaired reads to PE reads in the same TopHat2 run
  (please see the [manual entry](manual.shtml#mixed) for this usage). This
  includes reporting separate counts for the additional unpaired reads and
  making sure that the SAM flags in the output files reflect the paired or
  unpaired origin of the reads.
- Added the possibility to run TopHat just for the purpose of preparing the
  transcriptome index files (please see the [manual entry](manual.shtml#tbuild)
  for this special usage).
- The input read files can have different file formats, as TopHat now
  autodetects the FASTA/FASTQ format of each input file.
- Fixed a bug that could sometimes incorrectly rename the reads in the output
  alignments.
- The stats in `align_summary.txt` now reflect the *reported* mappings under the
  constraints of the provided Tophat options, instead of reflecting the
  internally detected alignments. As such, the number of reads with multiple
  mappings may appear to be incorrectly reported if the user provided options
  that directly affect the reporting of such multiple mapppings.
- Fixed a bug that caused TopHat to fail when bowtie1 and pre-filtering options
  were used together.

### TopHat 2.0.9 release 6/28/2013

**Note (6/29/2013):** this version is slightly updated to handle 1-bp exons when
using --GTF option.

Version 2.0.9 is a maintenance release providing better management of the
transcriptome data files and fixes a few problems found in earlier releases:

- Solved parsing issues with some GFF3 files that could produce a crash with
  previous versions.
- Starting with this version TopHat2 will automatically check for consistency
  and, if needed, rebuild the existing transcriptome data files after critical
  updates of the GFF parser or a detected change of the underlying annotation
  data (GFF file).
- The output file `unmapped.bam` no longer contains multi-mapped reads (reads
  with too many alignments found), but only reads for which a suitable alignment
  could not be found under the current alignment constraints.
- A new output file: `align_summary.txt` is now generated in the output
  directory, containing read (pair) input and mapping counts.
- Fixed a bug that added an extra XS tag in the output BAM file.
- Fixed a reporting bug that caused paired reads with a read containing its mate
  to be reported as unpaired.
- Fixed a bug in bam2fastx utility that caused the -M/--mapped-only option to be
  ignored (Note: this option is not used within TopHat).
- In tophat-fusion-post: fixed a bug that caused two genes of a fusion gene to
  sometimes be incorrectly ordered and reported.

### TopHat2 paper published 4/25/2013

The TopHat2 [paper](http://genomebiology.com/2013/14/4/R36/abstract) has been
published in [*Genome Biology*](http://genomebiology.com/).

- The simulation data set (error-free) is available
  [here](./downloads/tophat2_simulation_data/junction_test).

### TopHat 2.0.8 release 2/26/2013

**Note (4/12/2013):** patched version 2.0.8b was released in order to provide
compatibility with Bowtie v1.0.0

Version 2.0.8 is a quick fix release addressing the following issues:

- This version correctly handles the newest version of Bowtie2 v2.1.0.
- The segment mapping slow-down introduced by some Bowtie2 parameter changes in
  version 2.0.7 is now corrected.

### TopHat 2.0.7 release 1/23/2013

Version 2.0.7 is a maintenance release addressing some issues found in the
earlier releases:

- Please update Bowtie1 or Bowtie2 to the latest released versions (0.12.9 and
  2.0.5, respectively). It may be necessary to download the latest Bowtie genome
  indexes and it is strongly recommended to remove&rebuild the transcriptome
  indexes.
- The `-i/--min-intron-len` option now allows introns of length less than 50
- The `--no-mixed` option is now correctly handled. TopHat no longer produces
  singleton alignments when this option is used.
- Explicit mate pairing information (/1 or /2 suffix) in the read name in
  unmapped.bam is removed. The SAM flag provides the pairing information.
- TopHat spawned processes which sometimes showed the warning message like
  "*[main_samview] truncated file*" are now properly terminated.
- With a large number of reads and --fusion-search enabled, TopHat consumed a
  huge amount of memory, in particular, in long_spanning_reads program, which is
  now fixed.

### TopHat 2.0.6 release 11/02/2012

Version 2.0.6 is a maintenance release addressing some issues found in the 2.0.5
release:

- corrected the indel finding algorithm that caused segmentation fault in
  certain cases (long_spanning_reads and tophat_reports)
- fixed the Bowtie version checking code, adding support for newer, non-beta
  Bowtie2 versions
- several minor fixes in the fusion alignment algorithm
- fixed an incompatibility issue with Python versions older than 2.6 (restoring
  Python 2.4 compatibility)
- fixed and improved the resuming option (-R/--resume) to better handle various
  failure/resume situations
- added a warning about Bowtie1 and Bowtie2 index files in the same directory
  (causing trouble if they were built for different genomic sequences)

### TopHat 2.0.5 release 9/18/2012

Version 2.0.5 adds new options to better control the read alignment and to
improve mapping accuracy, and the ability to resume partial TopHat runs:

- along with `-N/--read-mismatches`, TopHat introduces new options for finer
  control of the read alignment process by limiting the number of mismatches,
  indels and indel length.  Please check new options
  [--read-gap-length and --read-edit-dist](faq.shtml#edit_dist).
- the new [--read-realign-edit-dist](manual.shtml#read_realign) option can be
  used to greatly [improve spliced-mapping accuracy](faq.shtml#accuracy)
  (especially in the absence of annotation data) by forcing the re-mapping of
  some or all reads regardless of them being already mapped in earlier steps of
  the pipeline.
- we added the option to resume a TopHat run which was prematurely
  terminated:[`-R/--resume <tophat_out>`](manual.html#resume)
- `--transcriptome-mismatches`  and `--genome-mismatches` are now deprecated

### TopHat 2.0.4 release 6/21/2012

Version 2.0.4 is a maintenance release addressing some issues found in the 2.0.3
release:

- Fixed a bug that caused the last stage of TopHat (tophat_reports) to
  occasionally crash for large data sets.
- For paired reads found to be incorrectly paired in the input files TopHat now
  outputs a warning message instead of terminating with an error.
- Alignments of paired reads mapped discordantly (e.g. on different chromosomes)
  are now reported by default. To disable this behavior, --no-discordant option
  can be used. Also please check --no-mixed option in the manual, which we
  borrow from Bowtie2 options.
- --fusion-search with Bowtie2 is still in developmental stage, it may require
  much memory space and produce many spurious fusions. You may want to try a
  combination of --bowtie1 and --fusion-search if it does not work.
- Environment variables such as BOWTIE_INDEXES and BOWTIE2_INDEXES are handled
  properly - please refer to the Bowtie website for more details about the
  variables.
- Prebuilt transcriptome indexes built by older versions of TopHat may not be
  compatible with this version due to some internal changes in parsing gtf
  files. It is strongly recommended to build a new transcriptome index.

### TopHat 2.0.3 release 5/26/2012

Users are strongly recommended to upgrade to this release as the source
distribution and the binary versions of TopHat2.0.2 have some serious issues
that cause runtime failure.

### iGenomes index and annotation have been updated to include Bowtie2 indexes (in addition to Bowtie1 indexes) - 5/23/2012

### TopHat 2.0.2 release 5/23/2012

Version 2.0.2 is a maintenance release:

**Note (9:50pm EST - 5/23):** this version is slightly updated to remove some
debugging code, which caused TopHat to exit abnormally.

- Fixed a bug TopHat2 aborts while reads overlapping with introns are being
  re-aligned, giving an error message like
  ./SeqAn-1.3/seqan/sequence/segment_infix.h:81 Assertion failed :
  data_begin_position \<= data_end_position was: 18446744073709551607 > 31
- Some unique alignments were set as secondary alignments using 0x100 SAM flag,
  which is now fixed.

### TopHat 2.0.1 maintenance release 5/17/2012

Version 2.0.1 is a maintenance release addressing some issues found in the 2.0.0
release:

- Fixed the problem with some alignments in the BAM output (accepted_hits.bam)
  missing quality values.
- The Read Group tag "RG" is now properly written for each alignment when using
  --rg-id and related options.
- More strict checking for genomic coordinates is performed when retrieving
  spliced sequences.
- Colorspace reads are now correctly handled (--color option).
- Paired-end input reads are now checked for consistency (proper ordering in the
  input files).
- Restored the functionality of options --no-sort-bam and --no-convert-bam.
- --transcriptome-only option is correctly processed.
- Some of alignments that overlap with introns are realigned against those
  corresponding splice sites. If those new alignments are better than the
  previous alignments, they will be reported.
- If the reference genome and the transcriptome files have the same prefix like
  genome (genome.fa and genome.gtf), it caused some naming problems for
  chromosomes, which is now fixed.
- Some of reads not present in neither accepted_hits.bam nor unmapped.bam are
  now reported correctly.

### TopHat 2.0.0 release 4/09/2012

Version 2.0.0 is a major release adding
[Bowtie 2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml) support,
better parallelization and the ability to align RNA-Seq reads across potential
fusion points.

- TopHat now uses Bowtie2 by default (if found in the system) although it can
  also fall back on Bowtie 1 (which is still required for SOLiD reads).

- Bowtie 2 integration features:

  - most of the optional SAM fields (AS, MD, NM, and etc.) generated by Bowtie 2
    are now reported by TopHat as well (reconstructed as necessary)
  - many of the Bowtie 2 options can now be directly given as TopHat options
    using [`--b2-<bowtie option name>`](manual.html#b2-option). These apply to
    initial read mappings, not to segment mappings - please see the
    corresponding [manual section](manual.html#b2-option).

  TopHat 2 maps reads against transcriptome (optional), genome, and novel/known
  splice sites using Bowtie 2 (or 1) in a fashion meant to increase the overall
  mapping sensitivity and accuracy. In the case of Bowtie 2, reads poorly mapped
  in the initial stages (with lower scoring alignments due to indels etc.) will
  be made available for re-mapping in downstream stages. Alignments obtained in
  all participating stages are pooled and the best alignments will be finally
  reported for each read. Please note that this TopHat version requires the
  installation of Bowtie version 2.0.0-beta5 or later; also note that Bowtie1
  and Bowtie2 indexes are different, so  it is necessary to use the new Bowtie 2
  indexes with TopHat 2 (unless --bowtie1 option is used or bowtie 2 is not
  found in the system). Since the iGenome Bowtie indexes do not include Bowtie 2
  indexes, you may want to download Bowtie 2 indexes from
  [the Bowtie2 website](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
  or build them using bowtie2-build.

- Most of the time-consuming steps in the TopHat 2 pipeline are now
  parallelized, reducing the total running time substantially on multi-processor
  systems.

- In addition to mapping across splice sites, TopHat 2 can now align reads
  across fusion points, which usually occur due to genomic translocations,
  read-through transcription, or trans-splicing; Tophat 2 integrates the fusion
  discovery engine previously found in TopHat-Fusion  (fusion mapping is
  optional, please see [the separate page](fusion_index.html) for fusion mapping
  and the [`--fusion-...`](manual.html#fusion) options in the manual).

- Colorspace (SOLiD) reads require the older version of Bowtie, since Bowtie 2
  does not provide support for this kind of reads.

- `--closure-search` and `--butterfly-search` options have been deprecated

- In addition to reporting the best (or primary) alignments (the original TopHat
  behavior), TopHat 2 can report the secondary alignments up to 20 (the default)
  paired or single alignments (see --report-secondary-alignments and
  -g/--max-multihits)

- The installation of the Boost package is now required in order to build TopHat
  2 from source (see  [Installation](tutorial.html)).

- New options affecting TopHat's output:

  - --keep-fasta-order (for those who prefer the order of reference sequences in
    the SAM output to match the order of the sequences in the genome fasta file)
  - --report-discordant-pair-alignments

- If you had some older versions of TopHat and TopHat-Fusion installed on your
  system, we suggest that you remove both programs before installing the new
  version and make sure that your system PATH includes the new version but does
  not include the other ones.

### Important notes - 3/26/2012

For those who want to follow our *Nature Protocols*, we suggest users use TopHat
1.3.2 (see the download links below) because TopHat 1.4.1 has some problems with
running the protocols when mapping some of the simulated reads (e.g., C2_R2).
These problems do not happen with real data, so reverting back to TopHat 1.3.2
is not necessary.

- [   Source code (version 1.3.2)](./downloads/tophat-1.3.2.tar.gz){onclick="javascript:
  pageTracker.\_trackPageview('/downloads/tophat'); "}
- [   Linux x86_64 binary (version 1.3.2)](./downloads/tophat-1.3.2.Linux_x86_64.tar.gz){onclick="javascript:
  pageTracker.\_trackPageview('/downloads/tophat'); "}
- [   Mac OS X x86_64 binary (version 1.3.2)](./downloads/tophat-1.3.2.OSX_x86_64.tar.gz){onclick="javascript:
  pageTracker.\_trackPageview('/downloads/tophat'); "}

### TopHat and Cufflinks protocol published at Nature Protocols - 3/12/2012

A complete
[bioinformatic protocol](http://www.nature.com/nprot/journal/v7/n3/full/nprot.2012.016.html)
for analysis of RNA-Seq data using our tools has been published at *Nature
Protocols*. The protocol covers read alignment with TopHat, gene and transcript
discovery with Cufflinks, annotation analysis with Cuffmerge and Cuffcompare,
differential expression analysis with Cuffdiff, and visualization with
CummeRbund. Several variants of the protocol are included for those who wish to
forgo certain analysis steps, such as gene discovery.

### TopHat 1.4.1 release 2/2/2012

Version 1.4.1 is a maintenance release addressing some issues found in the 1.4.0
release:

- fixed a bug that prevented the correct functionality of the new transcriptome
  mapping option for paired reads in cases where the user only wanted to map to
  the transcriptome (-T option) or there were no unmapped reads
- fixed the -N/--initial-read-mismatches option to support values larger than 3
  (e.g. for mapping on a genome from a different species).
- added basic file checks for extreme cases when there are no initially unmapped
  reads

### TopHat 1.4.0 release 1/5/2012

Version 1.4.0 includes the following new features and fixes:

- when a set of known transcripts is provided (-G/--GTF option) Tophat now takes
  the approach of mapping the reads on the transcriptome first, with only the
  unmapped reads being further aligned to the whole genome and going through the
  novel junction discovery process like before. This new approach was
  implemented by [Harold Pimentel](http://cs.berkeley.edu/%7Epimentel).
- new command line options have been added for the new mapping-to-transcriptome
  approach; please check [their documentation](manual.html#transcriptome) which
  includes important notes about the new
  [`--transcriptome-index`](manual.html#t_idx) option for efficient use of this
  approach
- the unmapped reads are now reported in the output directory as
  `unmapped_left.fq.z` (and `unmapped_right.fq.z` for paired reads)
- the --initial-read-mismatches value now also applies to final alignments
  resulted from joining segment mappings
- we adjusted the selection of hits to be reported in case of multi-mapped
  segments, reads and read pairs
- enhancements in junction discovery for the segment-search method in the case
  of paired-end reads
- the reported running time now includes days
- fixed the non-deterministic behavior that could cause some differences in the
  output of repeated Tophat runs
- fixed a regression bug that prevented the use of SOLiD reads with certain
  length of quality values

### TopHat 1.3.3 release 10/16/2011

Version 1.3.3 is primarily a bug-fix release:

- fixed a bug that prevented *coverage search* from being activated on short
  reads (with fewer than 3 segments, e.g. reads shorter than 75)
- fixed a samtools path inconsistency that in some system configurations caused
  tophat to exit with an error in the final stage, when sorting the
  "accepted_hits.bam" file
- for SOLiD reads, quality value strings should now be accepted with or without
  a primer value

### TopHat 1.3.2 release 9/5/2011

Version 1.3.2 includes the following fixes and improvements:

- Deprecated -r as a required parameter (defaults to 50)
- Tophat no longer requires named pipes (*mkfifo*) to work, which were used in
  the previous version to compress some of the temporary files, but was not
  supported on some file/systems; for systems supporting *mkfifo* the new -X
  option can be used to re-enable this functionality
- coverage-search is now working for a short read (e.g., \<40-bp) where a read
  is split into only one segment.

### iGenomes index and annotation packages available for download - 7/31/2011

Illumina has generously provided a set of freely downloadable packages that
contain everything you need to get started working with TopHat and Cufflinks.
These packages contain Bowtie indexes for the human, mouse, and fly genomes as
well as many others. The packages also contain annotation files (in GTF format)
from UCSC, Ensembl, NCBI, and other sources. These files are augmented with the
special attributes Cufflinks needs to perform differential splicing and promoter
analysis. We strongly encourage users to download and try these packages!

### TopHat 1.3.1 release 6/23/2011

Version 1.3.1 includes the following bug fixes and changes.

- Quality value strings beginning or ending with "*" are no longer truncated to
  a single quality value "*" in accepted_hits.bam
- SOLiD reads that have "!" (or 0) as the first quality value caused a runtime
  error, which is now fixed
- --closure-search is compatible with internal file compression
- --max-deletion-length option is correctly handled
- A new option --initial-read-mismatch option is introduced that users specify
  the number of mismatches allowed in the initial read mapping
- For short reads (usually \<45-bp), it is recommended that users decrease
  segment length (--segment-length) to about half the read length and segment
  mismatches (--segment-mismatches) to 0 or 1
- TLEN field in SAM format is correctly output
- Indel search has been turned on (by default) since TopHat 1.3.0 - users can
  disable the functionality using --no-novel-indels

### TopHat 1.3.0 release 6/2/2011

**Note (10:30 EST):** the binary packages for 1.3.0 have been updated to correct
a hardcoded python path.

This release includes some very substantial performance improvements, bug fixes,
and enhancements.

- Geo Pertea has restructured the internal workflow of TopHat so that nearly all
  temporary data is compressed during a run. This greatly reduces the on-disk
  footprint of TopHat runs, and also reduces the amount of disk I/O. These
  enhancements should improve running time on networked filesystems.
- Thanks to contributions from the [Picard](http://picard.sourceforge.net/) team
  (notably Alec Wysoker at the Broad Institute), TopHat has some needed SAM
  compliance fixes and some additional command line options that make it easier
  to incorporate TopHat into sequencing core workflows and automated processing
  pipelines.
- TopHat can optionally use Bowtie's `-n` flag as an alternative to the read
  mapping protocol. The default is still to use `-v`, which can result in better
  spliced alignment accuracy when reads contain relatively few sequencing errors
  (particularly at the 3' end)
- TopHat now supports both
  [GTF2 and GFF3](http://cufflinks.cbcb.umd.edu/gff.html)
- TopHat can take gzip or bzip2 compressed FASTQ or FASTA files as input,
  decompressing them on the fly (the decompression program is determined based
  on the file name suffix)
- The initial read inspection stage, used to determine the format, read length
  and other parameters needed for the run, is now significantly faster.
- A bug in the installer caused the tophat script to be duplicated (apparently
  without causing further problems). Thanks to John Marshall for the fix to this
  and several other issues.
- Numerous other minor bug fixes

### TopHat-Fusion 0.1.0 (Beta) release 5/09/2011

[TopHat-Fusion](http://tophat-fusion.sourceforge.net) is released, mainly
developed by Daehwan Kim and Steven Salzberg. TopHat-Fusion is an enhanced
version of TopHat with the ability to align reads across fusion points, which
results from the breakage and re-joining of two different chromosomes, or from
rearrangements within a chromosome. For more information, please visit
[the TopHat-Fusion website](http://tophat-fusion.sourceforge.net).

### New "Getting Help" email address for TopHat and Cufflinks

In order to more effectively answer user help requests and improve usability and
documentation, we have created an email address to which users can send messages
for technical support. If you have questions about Cufflinks or TopHat, please
send them to <tophat.cufflinks@gmail.com>. We will do our best to answer your
question in a timely fashion, although **please read the manual carefully**
before sending your email. We have very limited time to answer questions, and
most questions require careful, technical answers.

If you believe you have found a bug in the software, please **include a small
package of test data** with your email so that we can reproduce your problem
locally. A test example makes it much easier to correct the issue.

### TopHat 1.2.0 release 1/18/2011

Version 1.2.0 includes some important bug fixes as well as a major new feature.
Thanks to the efforts of Ryan Kelley from Illumina, TopHat now supports
detection of insertions and deletions using RNA-Seq data. TopHat will report
reads aligned across discovered indels by taking advantage of `I` and `D` CIGAR
operators as specified by the SAM format. For convenience, the indels discovered
during each run are also reported in BED files, similar to the junctions.bed
file that TopHat reports for splice junctions.

Version 1.2.0 also addresses the following issues:

- A problem with alignment of reads of mixed length has been fixed. Users with a
  wide range of read lengths, such as trimmed 454 data sets, are strongly
  encouraged to upgrade.
- A compatibility issue with samtools version 0.1.12a has been fixed.
- Runtime validation of input files (e.g. raw junctions files) has been
  improved.

### TopHat and Cufflinks now supported through Galaxy

We are very pleased to announce that you can now run TopHat and Cufflinks
through [Galaxy](http://usegalaxy.org). The Galaxy project aims to make
informatics tools accessible through the web, and allows you to experiment with
parameter settings and create sophisticated analysis workflows easily. Galaxy is
developed by researchers at Emory University and Penn State in the
[Taylor](http://bx.mathcs.emory.edu/) and
[Nekrutenko](http://www.bx.psu.edu/%7Eanton/) labs, respectively. We are
extremely grateful for the Galaxy team's work, and proud to have TopHat and
Cufflinks offered through their platform.

### TopHat 1.1.4 release 11/16/2010

Version 1.1.4 includes three important bug fixes:

- Another issue related to strand assignment in strand specific libraries has
  been fixed
- A limitation in aligning long reads has been overcome, substantially improving
  overall alignment sensitivity
- The `--gtf-annotations` was throwing an error during `prep_reads` due to a bug
  in internal command line parsing.

Several users pointed out that the recently released version 1.1.3 had "1.1.0"
listed in the version number on running TopHat. This has been corrected in the
1.1.4 build.

### TopHat 1.1.3 release 11/13/2010

This is a strongly recommend fix release of TopHat. Version 1.1.2 suffered from
a bug related to the addition of strand specific read processing that could
result in some reads being incorrectly assigned to the wrong strand. This bug
affected users of unstranded RNA-Seq data as well as users of stranded reads, so
1.1.3 is a recommended update for all users.

### TopHat 1.1.2 release 10/26/2010

This release of TopHat adds support for **strand-specific RNA-Seq alignment**
for reads produced by a number of strand-specific protocols. Please see the
manual for details. This release also supports **variable-length reads**.
Version 1.1.2 also fixes several bugs

- A sorting issue for pairs that align in multiple places has been fixed.
- Some portability issues, which resulted in segfaults on some systems, have
  been fixed in the precompiled binaries.

### TopHat 1.1.1 release 10/11/2010

This release of TopHat includes some fixes related to Colorspace read mapping.

- Negative quality values are now handled correctly.
- Comments at the beginning of csfasta files no longer trigger an error.
- `--integer-quals` no longer conflicts with `-i`
- The header in TopHat BAM files now correctly lists the sort order as
  `coordinate`, with group order `reference`

### Update - TopHat 1.1.0 packages

The build of 1.1.0 released yesterday was throwing an exception with single end
reads. This has been corrected and the packages have been updated.

### New developers - Daehwan Kim and Geo Pertea

The TopHat team has been joined by Daehwan Kim and Geo Pertea. Daehwan is a
Ph.D. student at the Center for Bioinformatics and Computational Biology (CBCB),
working with Steven Salzberg. He is principally responsible for extending TopHat
to support SOLiD sequencing reads. Geo is an informatics engineer at CBCB, and
has made numerous contributions to [Cufflinks](http://cufflinks.cbcb.umd.edu/)
along with a number of other tools built at CBCB.

### TopHat 1.1.0 release 10/03/2010

This release of TopHat includes some major enhancements:

- TopHat now supports Colorspace reads from Life Technologies' SOLiD sequencer,
  thanks to the efforts of Daehwan Kim and Geo Pertea. Note that you will need
  to [download](ftp://ftp.cbcb.umd.edu/pub/data/bowtie_indexes/) a Colorspace
  Bowtie index to use TopHat with SOLiD reads. Colorspace Bowtie indices
  typically have "\_c" in their name to distinguish them from nucleotide space
  indices.
- Alignments are now reported in BAM instead of SAM. This requires installation
  of the [SAM tools](http://samtools.sourceforge.net).
- GFF3 support has been dropped in favor of GTF. If you are working with an
  organism that is well annotated, we recommend supplying a GTF from
  [Ensembl](http://uswest.ensembl.org/info/data/ftp/index.html) or
  [UCSC](http://genome.ucsc.edu/cgi-bin/hgTables?command=start) to maximize
  spliced alignment sensitivity. TopHat will augment the annotated junctions
  with those it finds during each run.
- TopHat no longer outputs the wigglegram after each run, as browsers such as
  [IGV](http://www.broadinstitute.org/igv/), [IGB](http://www.bioviz.org/igb/)
  and [UCSC](http://genome.ucsc.edu/) can display BAM files directly.

### TopHat 1.0.14 (BETA) release 6/30/2010

This fix release includes a new FASTQ parser (written by Geo Pertea) and
generally improves error checking and reliability.

### TopHat 1.0.13 (BETA) release 2/5/2010

This is a fix release that addresses several bugs. Notably:

- SAM quality strings are now reported on the Phred scale, regardless of whether
  the input reads were in Phred or Solexa scaling, as require by the SAM spec.
  The conversion code in `qual.h/.cpp` was written by Ben Langmead and is
  borrowed from Bowtie.

### Bowtie index update 11/14/2009

In response to user requests,
[Ben Langmead](http://faculty.jhsph.edu/default.cfm?faculty_id=2209&grouped=false&searchText=&department_id=3&departmentName=Biostatistics)
was kind enough to rebuild the Bowtie indexes for human and mouse from UCSC
assembly fasta files. Because UCSC fasta files have simple record names, such as
"chrX", TopHat runs against them are easier to visualize with the
[UCSC genome browser](http://genome.ucsc.edu/) or the
[Integrative Genomics Viewer](http://www.broadinstitute.org/igv/). We recommend
that users who need indexes other than human or mouse build them from UCSC fasta
files.

### TopHat 1.0.12 (BETA) release 10/28/2009

This release includes both critical fixes and new features, including:

- A serious bug that hurts sensitivity for short (~36bp) reads that was
  introduced in 1.0.11 has been fixed
- TopHat now automatically **deletes** the intermediate files it produces during
  each run, which can be very large. You can preserve them by specifying
  `--keep-tmp` at the beginning of a run.
- A new optional search algorithm for short (~36bp) reads, designed to improve
  junction detection sensitivity, is now available with `--butterfly-search`.
- TopHat **no longer calculates gene expression**. Users interested in
  expression calculations should consider using
  [Cufflinks](http://cufflinks.cbcb.umd.edu) for gene- and isoform-level
  expression calculations.
- Numerous performance enhancements and reductions in memory usage. For reads
  75bp or longer, memory usage is dramatically lower, and should scale much for
  runs with hundreds of millions of reads.
- The [manual](manual.html) has been updated to better describe the types of
  reads TopHat expects. The manual also incorrectly stated that TopHat doesn't
  look for "GC-AG" and "AT-AC" introns, and this has been corrected.

### IMPORTANT - Bowtie update 10/13/2009

Until recently, there was a bug that could cause TopHat to report no alignments
or junctions with some Bowtie indexes (including) some indexes downloadable from
this site. All users are strongly encouraged to upgrade to Bowtie 0.11.0 or
later, and the next update to TopHat will force this upgrade.

### TopHat 1.0.11 (BETA) and Cufflinks release 9/26/2009

We're pleased to announce the release of a sister tool to TopHat, called
[Cufflinks](http://cufflinks.cbcb.umd.edu). TopHat aligns your RNA-Seq reads;
Cufflinks assembles those alignments into transcripts and also calculates
isoform and gene level expression in your samples.

This TopHat release contains a number of stability improvements, fixes, and some
substantial performance increases. The disk footprint is also reduced, though
it's still large, and further reductions are coming in future releases.

We advise all users to adopt Cufflinks to compute expression values. Cufflinks
contains a sophisticated algorithm for this calculation, that is far more
accurate than TopHat's method. In an upcoming release of TopHat, the RPKM
calculation in TopHat will be **removed** to simplify maintenance.

### 1.0.10 (BETA) release 7/30/2009

This is a fix release. Notable changes:

- More SAM compliance fixes.
- Reduced the frequency of certain types of false junctions through improved
  spliced alignment filtering

### Minor update to 1.0.9 7/10/2009

Version 1.0.9 of TopHat released on 7/8/09 had an incorrect default value for
--max-intron length. It is now 500,000, as intended.

### 1.0.9 (BETA) release - 7/8/2009

This release includes both fixes and new features. This upgrade **requires**
Bowtie 0.10.0.0 or later. Other changes including:

- Substantially improved sensitivity for reads shorter than 75bp
- An optional "gap-filling" phase to map multireads from transcribed repeats
- Fixed some SAM compliance issues
- Optional (limited) search for alignments that involve microexons
- Complex index record names no longer crash the pipeline.
- The command line options have been overhauled, and the meaning of the
  `-a/--min-anchor` option has changed. Please see the [manual](manual.html) for
  further details.
- Closure search is now off by default for all read types
- Coverage search is off by default for reads 75bp or longer
- Previous version could report spliced alignments with gaps longer than
  `--max-intron`, if any were found. The `--max-intron` and `--min-intron`
  limits are now strictly enforced.

### Bowtie updated to 0.10.0.0

**IMPORTANT**: TopHat 1.0.8 is incompatible with Bowtie 0.10.0.0, which was
released this week. While the release of TopHat 1.0.9, which is imminent, will
fix the incompatibilities, users are encouraged to stick with Bowtie 0.9.9.3 for
now.

### 1.0.8 (BETA) release - 5/25/2009

This is mostly a fix release, but all users are encourage to upgrade, as some of
the bugs fixed were fairly major. Other notable improvements include:

- If you have reads 50bp or longer, TopHat will look for `GC-AG` and `AT-AC`
  introns
- Logging has been improved
- Fewer false positives in gene families with tandem copies

**Known issues:**

- Some users have reported pipeline crashes when using Bowtie indexes with long
  or complex record names. This will be fixed in the next release, but for now,
  using an index with simple names (no spaces or pipes) is a workaround. Users
  are recommended to use names like "chr12" to avoid problems.

### 1.0 (BETA) release - 5/4/2009

TopHat has been almost entirely redesigned and rewritten to handle
"second-generation" RNA-Seq data. Reads longer than 50bp and paired end reads
are substantially more powerful for finding splice junctions, and TopHat needed
new algorithms to take advantage of them. While this release should be
considered a beta, and still contains bugs, it has been under development for
several months and has been tested by several groups on both first- and
second-generation RNA-Seq data in multiple organisms. Longer and/or paired end
reads provide a dramatic leap in sensitivity and specificity. Notable
improvements include:

- Paired-end RNA-Seq read support
- Long read support
- Improved SAM output
- No longer depends on Maq
- Mismatches near splicing anchors now allowed
- Much more of the pipeline is multithreaded, yielding a massive performance
  boost
- Compiles under GCC 4.3

### TopHat paper published - 3/16/2009

Our
[paper](http://bioinformatics.oxfordjournals.org/cgi/content/abstract/btp120) on
discovering splice junctions has appeared at
[Bioinformatics](http://bioinformatics.oxfordjournals.org/).

### 0.8.3 release - 3/12/2009

This release contains the following enhancements and fixes:

- Reporting now has a smaller memory footprint
- A possible source of erroneous alignments due to hashing collisions has been
  eliminated
- The install scripts now correctly detects whether to build TopHat with 64-bit
  compiler flags.

### TopHat paper accepted - 3/1/2009

Our paper on discovering splice junctions has been accepted at
[Bioinformatics](http://bioinformatics.oxfordjournals.org/), and should appear
soon.

### 0.8.2 release - 3/1/2009

This release contains the following enhancements and fixes:

- TopHat now reports the alignments it finds in the
  [SAM format](http://samtools.sourceforge.net%0A%09%09%09%09). The SAM tools
  were written primarily by Heng Li at Sanger, and will allow TopHat users to
  call expressed SNPs from their RNA-Seq reads. The SAM tools themselves are
  still under development, so TopHat's SAM support should be considered
  experimental.
- You can now specify a list of junctions for TopHat to check in a raw format,
  without using a GFF file of genes
- The new `-o` option allows you to change where TopHat puts its output, instead
  of always writing to "./tophat_out"

### 0.8.1 release - 1/30/2009

This release contains the following enhancements and fixes:

- New experimental support for user-supplied annotations. TopHat will accept a
  GFF file, and will look for junctions contained in the GFF file. TopHat will
  also perform a basic RPKM calculation on the regions in the annotation,
  normalized to those annotations only (rather than the whole map). The file
  must contain "gene", "exon" and "mRNA" records, in the normal record ID,
  Parent heirarchy. Users are encouraged to treat GFF support as unstable and
  interpret their results with caution.
- Several minor bugfixes.

TopHat 0.8.1 uses some code kindly provided by
[Robert Bradley](http://math.berkeley.edu/%7Erbradley/). The code originally
came from Rob's statistical alignment package
[FSA](http://fsa.sourceforge.net/).

### 0.8.0 release - 1/19/2009

This release contains the following enhancements and fixes:

- Dramatic reduction in false positives.
- TopHat now estimates a minor isoform frequency for each splice junction, and
  filters infrequent events to cut down dramatically on the false positives. By
  default, minor isoforms must occur at at least 15 percent of the major
  isoform.
- The new output file coverage.wig is a UCSC wigglegram of alignment coverage.
- TopHat supports multithreading, though not all stages of the pipeline use
  multiple threads.
- TopHat now allows reads to have multiple alignments, and it suppresses
  alignments for reads that have more than a user-specified number (10, by
  default).
- The memory exhaustion problem associated with converting Bowtie alignments to
  Maq has been fixed.
- You are no longer required to concatenate your reads into a single input file.
- TopHat will attempt to automatically determine seed length, quality scale, and
  FASTA/FASTQ format from your input reads.
- If you are missing a Maq binary fasta file for your reference, one will be
  created in the output directory using `bowtie-inspect`. You can copy this file
  to the location of your bowtie index to avoid this step in your next run.

### 0.7.2 release - 12/05/2008

The following issues have been fixed:

- Bowtie 0.9.8 renamed `bowtie-convert` to `bowtie-maqconvert`, and TopHat is
  now compatible with both the new and old name.
- Minor cosmetic improvements in the TopHat output log.
- Improved checking in the installer to emit sensible error messages when
  compiling on Solaris. Solaris is currently not supported, but hopefully will
  be in the next release.

Known issues:

- TopHat can exhaust memory when run with many (> 50 million) reads on some
  machines. This will be fixed in the next release.

### 0.7.1 release - 11/08/2008

The following issues have been fixed:

- Maq 0.7.0 changed the Maq map file format. Bowtie 0.9.7 now supports both the
  new and old mapping format, and thus so now does TopHat. TopHat now checks the
  version of Maq on the system and uses the correct format.
- Minor command line interface improvements
- The `-X` option has been added to allow the use of FASTQ files that are scaled
  on the Solexa quality scale, as opposed to Phred (the default). Note that
  TopHat doesn't support FASTQ-int, only ASCII-encoded qualities are used.
- The `-D` option has been added, allowing users to specify when to look for
  junctions within single islands, as opposed to just between two distinct
  islands
- The `-Q` option allows the user to specify a Phred quality character below
  which the island consensus caller will use the reference base call. That is,
  TopHat will not allow SNPs to be called where base quality drops below a
  certain threshold.
- TopHat now includes Heng Li's `fq_all2std.pl` format conversion script to make
  installation easier.

### 0.7.0 release - 10/27/08

The first public release of TopHat is now available for download. To use TopHat,
you will need to install [Bowtie](http://bowtie-bio.sourceforge.net) and
[Maq](http://maq.sourceforge.net). Both are open source and freely available
under the Artistic license. When you install Bowtie, you should also install the
Bowtie index for the genome in your RNA-Seq experiment, if one is available. If
there is no pre-built index for the organism you're interested in, you can
follow the Bowtie manual's section on
[how to build one yourself](http://bowtie-bio.sourceforge.net/manual.html#indx).

Because this is the first release, the manual is very limited. Only the basic
options have been described. However, we will be updating it frequently, so
please check back. If you find something unclear, or have questions about how
TopHat works, please email [Cole Trapnell](mailto:cole@cs.umd.edu). We will be
posting a list of frequently asked questions soon.

In this release, TopHat **does not consider mate pairing** between reads. You
can analyze paired-end RNA-Seq data with TopHat, but the program won't make use
of the mate information. Yet. Use of mate pair information is our **top
development priority**. Check back soon for a release with full paired-end
support
