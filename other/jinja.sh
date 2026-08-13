set -x

jq . _people/people.schema.json > /dev/null

check-jsonschema --schemafile _people/people.schema.json _people/faculty.yaml
check-jsonschema --schemafile _people/people.schema.json _people/students.yaml
check-jsonschema --schemafile _people/people.schema.json _people/alumni.yaml
check-jsonschema --schemafile _people/people.schema.json _people/collaborators.yaml
check-jsonschema --schemafile _people/people.schema.json _people/postdocs.yaml
check-jsonschema --schemafile _people/people.schema.json _people/staff.yaml

jinja2 _templates/people.jinja _people/faculty.yaml       -D title="Faculty"  | uniq > people/faculty.md
jinja2 _templates/people.jinja _people/students.yaml      -D title="Students" | uniq > people/students.md
jinja2 _templates/people.jinja _people/alumni.yaml        -D title="Alumni"   | uniq > people/alumni.md
jinja2 _templates/people.jinja _people/collaborators.yaml -D title="Collaborators" | uniq > people/collaborators.md
jinja2 _templates/people.jinja _people/postdocs.yaml      -D title="Postdocs"      | uniq > people/postdocs.md
jinja2 _templates/people.jinja _people/staff.yaml         -D title="Staff"         | uniq > people/staff.md

###

jq . _software/software.shema.json > /dev/null

check-jsonschema --schemafile  _software/software.shema.json  _software/alignment.yaml
check-jsonschema --schemafile  _software/software.shema.json  _software/gene_finding.yaml
check-jsonschema --schemafile  _software/software.shema.json  _software/genome_assembly.yaml
check-jsonschema --schemafile  _software/software.shema.json  _software/metagenomics.yaml
check-jsonschema --schemafile  _software/software.shema.json  _software/other_tools.yaml
check-jsonschema --schemafile  _software/software.shema.json  _software/variant_analysis.yaml

jinja2 _templates/software.jinja _software/alignment.yaml       -D title="Alignment"  > software/alignment.md
jinja2 _templates/software.jinja _software/gene_finding.yaml       -D title="Computational Gene Finding"  > software/gene_finding.md
jinja2 _templates/software.jinja _software/genome_assembly.yaml       -D title="Genome Assembly"  > software/genome_assembly.md
jinja2 _templates/software.jinja _software/metagenomics.yaml       -D title="Metagenomics"  > software/metagenomics.md
jinja2 _templates/software.jinja _software/other_tools.yaml       -D title="Other Sequence Analysis Tools"  > software/other_tools.md
jinja2 _templates/software.jinja _software/transcriptome_assembly.yaml       -D title="Transcriptome Assembly"  > software/transcriptome_assembly.md
jinja2 _templates/software.jinja _software/variant_analysis.yaml       -D title="Variant Analysis Tools"  > software/variant_analysis.md

