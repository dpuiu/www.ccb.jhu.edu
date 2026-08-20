#!/usr/bin/env bash

set -eux

### people

jq . _people/people.schema.json > /dev/null

check-jsonschema --schemafile _people/people.schema.json _people/faculty.yaml
check-jsonschema --schemafile _people/people.schema.json _people/students.yaml
check-jsonschema --schemafile _people/people.schema.json _people/alumni.yaml
check-jsonschema --schemafile _people/people.schema.json _people/collaborators.yaml
check-jsonschema --schemafile _people/people.schema.json _people/postdocs.yaml
check-jsonschema --schemafile _people/people.schema.json _people/staff.yaml

mkdir -p people/
jinja2 _templates/people.jinja _people/faculty.yaml       -D title="Faculty"  	   -D label="faculty"		| uniq > people/faculty.md
jinja2 _templates/people.jinja _people/students.yaml      -D title="Students" 	   -D label="students"		| uniq > people/students.md
jinja2 _templates/people.jinja _people/alumni.yaml        -D title="Alumni"   	   -D label="alumni"		| uniq > people/alumni.md
jinja2 _templates/people.jinja _people/collaborators.yaml -D title="Collaborators" -D label="collaborators"	| uniq > people/collaborators.md
jinja2 _templates/people.jinja _people/postdocs.yaml      -D title="Postdocs"      -D label="postdocs"		| uniq > people/postdocs.md
jinja2 _templates/people.jinja _people/staff.yaml         -D title="Staff"         -D label="staff"		| uniq > people/staff.md

### software

jq . _software/software.schema.json > /dev/null

check-jsonschema --schemafile  _software/software.schema.json  _software/alignment.yaml
check-jsonschema --schemafile  _software/software.schema.json  _software/gene-finding.yaml
check-jsonschema --schemafile  _software/software.schema.json  _software/genome-assembly.yaml
check-jsonschema --schemafile  _software/software.schema.json  _software/metagenomics.yaml
check-jsonschema --schemafile  _software/software.schema.json  _software/other-tools.yaml
check-jsonschema --schemafile  _software/software.schema.json  _software/variant-analysis.yaml

mkdir -p software/
jinja2 _templates/software.jinja _software/alignment.yaml       	-D title="Alignment" -D label="alignment"  > software/alignment.md
jinja2 _templates/software.jinja _software/gene-finding.yaml       	-D title="Computational Gene Finding" -D label="gene-finding" > software/gene-finding.md
jinja2 _templates/software.jinja _software/genome-assembly.yaml       	-D title="Genome Assembly" -D label="genome-assembly" > software/genome-assembly.md
jinja2 _templates/software.jinja _software/metagenomics.yaml       	-D title="Metagenomics" -D label="metagenomics" > software/metagenomics.md
jinja2 _templates/software.jinja _software/other-tools.yaml       	-D title="Other Sequence Analysis Tools" -D label="other-tools" > software/other-tools.md
jinja2 _templates/software.jinja _software/transcriptome-assembly.yaml  -D title="Transcriptome Assembly" -D label="transcriptome-assembly" > software/transcriptome-assembly.md
jinja2 _templates/software.jinja _software/variant-analysis.yaml       	-D title="Variant Analysis Tools" -D label="variant-analysis" > software/variant-analysis.md


### software (all)

yq -y -s '{software: [.[].software[]] | sort_by(.id)}' _software/*.yaml  > _software/all.yaml
check-jsonschema --schemafile  _software/software.schema.json  _software/all.yaml
jinja2 _templates/software.jinja _software/all.yaml       -D title="All" -D label="software" > software/all.md


### data

jq . _data/data.schema.json > /dev/null
check-jsonschema --schemafile  _data/data.schema.json  _data/data.yaml
check-jsonschema --schemafile  _data/data.schema.json  _data/eupathdb.yaml

mkdir -p data/
jinja2 _templates/data.jinja _data/data.yaml     -D title="Web Servers and Databases" 	-D label="web" 		> data/data.md
jinja2 _templates/data.jinja _data/eupathdb.yaml -D title="EuPathDB" 			-D label="eupathdb" 	> data/eupathdb.md
