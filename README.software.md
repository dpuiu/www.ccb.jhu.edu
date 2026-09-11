### 7.4b YAML Queries (Software)

The `_software/all.yaml` file stores software metadata as a list of records under the `software` key. Each record contains fields such as `id`, `name`, `status`, `category`, `url`, `pmcid`, and `description`.

The examples below demonstrate common `yq` operations for inspecting, extracting, counting, filtering, and querying software metadata.

#### Extract the First Record

Extract the first software record:

```bash
yq -y '.software[0]' _software/all.yaml
```

Example output:

```yaml
id: bowtie
name: Bowtie
status: current
category:
  - alignment
pmcid: PMC2690996
url: https://bowtie-bio.sourceforge.net/index.shtml
description: 'An ultrafast, memory-efficient short read aligner that ...'
```

#### Extract Software Names

Extract the names of all software packages:

```bash
yq -r '.software[].name' _software/all.yaml
```

Example output:

```text
Bowtie
HISAT
HISAT2
...
```

#### Count Software by Status

Count the number of software packages in each status:

```bash
yq -r '.software[].status' _software/all.yaml |
    sort |
    uniq -c
```

Example output:

```text
 9 new
31 current
35 archived
```

#### Count Software by Category

Count the number of software packages in each category:

```bash
yq -r '.software[].category[]' _software/all.yaml |
    sort |
    uniq -c
```

Example output:

```text
 9 alignment
10 gene-finding
15 genome-assembly
 9 metagenomics
16 other-tools
11 transcriptome-assembly
 5 variant-analysis
```

Because `category` is a YAML list, `.category[]` extracts each category before counting.

#### Filter by Category and Status

Select software that has a status of `new` and belongs to the `gene-finding` category:

```bash
yq -y '.software |= map(
    select(.status == "new" and (.category[] == "gene-finding"))
)' _software/all.yaml
```

Example output:

```yaml
software:
  - id: eviann
    name: EviAnn
    status: new
    category:
      - gene-finding
    url: https://github.com/alekseyzimin/EviAnn_release
    pmcid: PMC12132231
    description: A novel genome annotation software package...
  - id: lifton
    name: LiftOn
    status: new
    category:
      - gene-finding
    url: https://khchao.com/LiftOn
    pmcid: PMC11874971
    description: LiftOn combines DNA and protein alignments to improve genome annotation.
```

#### Extract GitHub URLs

Extract software URLs that point to GitHub:

```bash
yq -r '.software[].url' _software/all.yaml |
    grep 'github\.com' |
    sort -u |
    head -n 3
```

Example output:

```text
https://github.com/agshumate/Liftoff
https://github.com/alekseyzimin/EviAnn_release
https://github.com/alekseyzimin/masurca
```

The `sort -u` command removes duplicate URLs before displaying the first three results.

#### Extract Software with a Specific Status

Extract the names and URLs of all archived software:

```bash
yq -r '.software[] | select(.status == "archived") |
    [.name, .url] | @tsv' _software/all.yaml
```

Example output:

```text
OldTool	https://github.com/example/OldTool
AnotherTool	https://example.org/AnotherTool
...
```

#### Extract Software by Category

Extract the names of all software packages in the `genome-assembly` category:

```bash
yq -r '.software[] |
    select(.category[] == "genome-assembly") |
    .name' _software/all.yaml
```

Example output:

```text
Canu
Flye
hifiasm
HiCanu
...
```

#### Sort Software by Name

Sort the software records alphabetically by name:

```bash
yq -y '.software |= sort_by(.name)' _software/all.yaml
```

#### Select Specific Fields

Keep only the `id`, `name`, `status`, and `url` fields:

```bash
yq -y '.software |= map({id, name, status, url})' _software/all.yaml
```

This is useful for creating a simplified YAML file or preparing the data for conversion to another format.
