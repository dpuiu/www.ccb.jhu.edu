Microbial Databases
===================

Microbial2025
-------------

A comprehensive microbial reference database for metagenomic classification and pathogen detection, spanning archaea, bacteria, fungi, viruses, and eukaryotic pathogens.

**Microbial2025** is a curated and contamination-filtered resource built for metagenomic classification and pathogen detection. 
It totals **71,120** genomes deposited in **RefSeq** as of **December 31, 2025**, spanning all major domains of life together with several categories of common contaminants.

All genomes were retrieved in complete or near-complete form from NCBI RefSeq, with one exception: 
the **EuPathDB** collection, which predominantly contains draft assemblies, reflecting the incomplete sequencing status of many eukaryotic parasites.

.. plotly::

   import pandas as pd
   import plotly.graph_objects as go

   df = pd.read_csv("microbial.csv")

   fig = go.Figure()

   fig.add_trace(go.Pie(
       labels=df["Category"],
       values=df["Count"],
       textinfo="none",
       domain=dict(x=[0, 0.4]),
       direction="clockwise" 
   ))

   fig.add_trace(go.Table(
       domain=dict(x=[0.5, 1]),
       header=dict(values=["Category", "Count", "Percent"]),
       cells=dict(values=[df["Category"], df["Count"].apply(lambda x: f"{x:,}"), df["Percent"]])
   ))

   fig.update_layout(title="Composition - Genomes by Category")

**Human** and **UniVec/EmVec** entries are contaminant-screening categories included alongside the taxonomic reference set, 
used to flag host and vector-sequence contamination during classification. 
Eukaryotic pathogen genomes were obtained from `VEuPathDB <https://veupathdb.org/veupathdb/app/downloads>`_, release **68**.

genomes retrieved from NCBI RefSeq (complete / near-complete) and EuPathDB (predominantly draft assemblies)  
snapshot date 2025-12-31  
database deposited at https://benlangmead.github.io/aws-indexes/k2

