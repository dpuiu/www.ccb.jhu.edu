### 7.4a YAML Queries (People)

This section demonstrates common `yq` operations for querying, transforming, filtering, and combining the People YAML files.

#### Extract the First Record

Extract the first person from `faculty.yaml`:

```bash
yq -y '.people[0]' _people/faculty.yaml
```

Example output:

```yaml
id: steven-l-salzberg
name: Steven L. Salzberg, Ph.D.
titles:
  - Bloomberg Distinguished Professor of Biomedical Engineering, Computer Science,
    and Biostatistics
  - Director, Center for Computational Biology
affiliations:
  - bme
  - cs
  - bs
homepage: https://salzberg-lab.org
email: salzberg@jhu.edu
role: faculty
```

#### Extract Faculty Names

Extract the names of all faculty members:

```bash
yq -r '.people[].name' _people/faculty.yaml
```

Example output:

```text
Steven L. Salzberg, Ph.D.
Dan Arking, Ph.D.
Joel Bader, Ph.D.
...
```

#### Count Faculty Members

Count the number of faculty members:

```bash
yq '.people | length' _people/faculty.yaml
```

Example output:

```text
25
```

#### Sort People by Name

Sort the `people` list alphabetically by `name`:

```bash
yq -y '.people |= sort_by(.name)' _people/faculty.yaml
```

#### Select Specific Fields

Keep only the `id`, `name`, and `email` fields:

```bash
yq -y '.people |= map({id, name, email})' _people/faculty.yaml
```

This produces a YAML document containing only the selected fields. The same data can be converted to CSV.

#### Convert YAML to CSV

Convert selected fields directly to CSV using `yq`:

```bash
yq -r '.people[] | [.name, .email] | @csv' _people/faculty.yaml
```

Alternatively, convert the selected records to JSON and use `csvkit`:

```bash
yq -j '.people | map({name, email})' _people/faculty.yaml |
    in2csv -f json
```

#### Merge YAML Files

Merge all People YAML files in `_people/` into a single file:

```bash
rm -f _people/all.yaml
yq -y -s '{people: [.[].people[]]}' _people/*.yaml > _people/all.yaml
```

The resulting `_people/all.yaml` contains all entries under a single `people` key.

> **Note:** `all.yaml` is a generated file. Edit the individual YAML source files rather than editing `all.yaml` directly.

#### Count People by Role

Count the number of people in each role:

```bash
yq -r '.people[].role' _people/all.yaml | sort | uniq -c
```

Example output:

```text
     22 alumni
      7 collaborators
     25 faculty
      3 postdocs
      3 staff
     11 students
```

#### Filter Faculty

Select a faculty by id:

```bash
yq -y '{"person": (.people | map(select(.id == "steven-l-salzberg"))[0])}' \
  _people/faculty.yaml > _people/steven-l-salzberg.yaml
```

Select only entries whose `role` is `faculty`:

```bash
yq -y '.people |= map(select(.role == "faculty"))' \
    _people/all.yaml > _people/faculty.yaml
```

This creates a `faculty.yaml` file containing only faculty members.

#### Generate a Faculty PMC Publication Query

Generate a PubMed Central search query containing all faculty names:

```bash
{
    echo '    "PUB": ('
    echo '        "https://pmc.ncbi.nlm.nih.gov/search/?"'
    echo '        "term="'

    yq -r '.people[].name' _people/faculty.yaml |
        cut -d',' -f1 |
        sed 's/ /+/g; s/$/%5Bau%5D+OR+/' |
        sed '$ s/+OR+$//' |
        sed 's/^/        "/; s/$/"/'

    echo '    ),'
}
```

This extracts each faculty member's name, removes the suffix after the first comma (such as `Ph.D.`), URL-encodes spaces, and appends the PubMed author field `[au]`.

The resulting text can be used as the `PUB` component of a PubMed Central search configuration.
