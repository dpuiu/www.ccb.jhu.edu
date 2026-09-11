<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [CCB Website Documentation](#ccb-website-documentation)
  - [1. Create a Copy](#1-create-a-copy)
  - [2. Install the Required Tools](#2-install-the-required-tools)
  - [3. Sing In to GitHub](#3-sing-in-to-github)
  - [4. Get a Local Copy](#4-get-a-local-copy)
    - [4.1 Clone the Repository](#41-clone-the-repository)
    - [4.2 Update an Existing Clone](#42-update-an-existing-clone)
  - [5. Repository Structure](#5-repository-structure)
  - [6. Build the Website Locally](#6-build-the-website-locally)
    - [6.1 Create a Python Virtual Environment](#61-create-a-python-virtual-environment)
    - [6.2 Build the Website](#62-build-the-website)
    - [6.3 View the Website](#63-view-the-website)
  - [7. Edit Website Content](#7-edit-website-content)
    - [7.1 Explore the Website Structure](#71-explore-the-website-structure)
    - [7.2 Add a Markdown Page](#72-add-a-markdown-page)
    - [7.3 Edit a Markdown Page](#73-edit-a-markdown-page)
    - [7.4 Edit and Query YAML Documents](#74-edit-and-query-yaml-documents)
      - [7.4.1 Validate YAML Data](#741-validate-yaml-data)
      - [7.4.2 Query YAML Data](#742-query-yaml-data)
    - [7.5 Convert YAML to Markdown](#75-convert-yaml-to-markdown)
    - [7.6 Cross-references](#76-cross-references)
    - [7.7 Substitutions](#77-substitutions)
    - [7.8 Edit Templates](#78-edit-templates)
    - [7.9 Edit the Sphinx Configuration](#79-edit-the-sphinx-configuration)
    - [7.10 Edit CSS](#710-edit-css)
    - [7.11 Edit JavaScript](#711-edit-javascript)
  - [8. Review Your Changes](#8-review-your-changes)
  - [9. Commit or Undo Your Changes](#9-commit-or-undo-your-changes)
  - [10. Automated Build and Deployment](#10-automated-build-and-deployment)
    - [10.1 Enable GitHub Actions](#101-enable-github-actions)
    - [10.2 Configure GitHub Actions](#102-configure-github-actions)
    - [10.3 Configure GitHub Pages](#103-configure-github-pages)
    - [10.4 Run the Workflow](#104-run-the-workflow)
    - [10.5 Monitor the Deployment](#105-monitor-the-deployment)
    - [10.6 View the GitHub Pages Website](#106-view-the-github-pages-website)
  - [11. Submit Your Updates](#11-submit-your-updates)
  - [12. Aprove the Updates](#12-aprove-the-updates)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# CCB Website Documentation

This repository contains the source files for the new Johns Hopkins [**Center for Computational Biology (CCB)**](https://ccb.jhu.edu/) website:
https://dpuiu.github.io/www.ccb.jhu.edu/

The website is built with [**Sphinx**](https://www.sphinx-doc.org/) and the modern, responsive [**PyData Sphinx Theme**](https://pydata-sphinx-theme.readthedocs.io/).

**Sphinx** builds the CCB website from Markdown, YAML data, templates, and configuration files. 
**Sphinx** and the **extensions** provide navigation, search, tables of contents, cross-references, permalinks, redirects, substitutions, sitemaps, bibliographies, templates, and other documentation features.

Content is written in [**MyST Markdown**](https://mystmd.org/), an enhanced version of [**Markdown**](https://www.markdownguide.org/) designed for technical and scientific documentation. 
The repository also contains [**YAML**](https://yaml.org/) data files, [**Jinja templates**](https://jinja.palletsprojects.com/en/stable/) and [**WebP**](https://developers.google.com/speed/webp) images.

Development and maintenance use [**yq**](https://github.com/kislyuk/yq) for YAML processing, 
[**csvkit**](https://csvkit.readthedocs.io/) for CSV data, 
[**doctoc**](https://github.com/thlorenz/doctoc) for Markdown tables of contents, 
[**lychee**](https://lychee.cli.rs/) for link checking.

**No HTML editing is necessary; HTML files are generated automatically from the source files.**

**Contributions from CCB collaborators and lab members are welcome.** 
You can help improve the website by editing the source files and submitting GitHub **pull requests**. 
All changes are **reviewed before being merged and published** to the website.


```text
YAML + MyST Markdown + Jinja templates + conf.py + WebP   # source files
                         ↓
                       Sphinx
                         ↓
                      _build/                             # HTML files
                         ↓
                    Web website
```

---

## 1. Get a GitHub Copy

Using a web browser:

1. Sign in to **GitHub**.
2. Open the [CCB website repository](https://github.com/dpuiu/www.ccb.jhu.edu).
3. Click **Fork** in the upper-right corner to create your own copy of the repository on GitHub.

If you already have a fork, open it and click **Sync fork** to bring it up to date with the original repository.  
You can make changes in your copy and submit them to the original repository through a **pull request**.

---

## 2. Install the Required Tools

Open a Linux terminal and check that **Python**, **Git**, and the **GitHub CLI** are installed:

```bash
python --version
git --version
gh --version
```

If any are missing, install them on Ubuntu with:

```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv python-is-python3 git gh
```

---

## 3. Sign In to GitHub

Authenticate the GitHub CLI and get your GitHub username:

```bash
gh auth login
GITHUB_USERNAME=$(gh api user --jq .login)
echo "$GITHUB_USERNAME"
```

The `gh auth login` command will guide you through the authentication process.

---

## 4. Get a Local Copy

### 4.1 Clone the Repository

If you have not cloned the repository before:

```bash
git clone https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu.git
cd www.ccb.jhu.edu
```

### 4.2 Update an Existing Clone

If you already have a local copy:

```bash
cd www.ccb.jhu.edu
git pull
```

It is a good idea to update your local copy before starting new work.

---

## 5. Repository Structure

The repository is organized by website section. Most website content is written in **MyST Markdown** (`.md`), while structured data is maintained in **YAML** (`.yaml`) files.

You can view the repository structure with:


```bash
tree .
```

```text
.
├── index.md                         # Main website page
├── conf.py                          # Sphinx configuration
├── Makefile                         # Website build commands
├── requirements.txt                 # Python/Sphinx dependencies
├── README.*md                       # Project documentation
│
├── about/                           # General CCB information
│   ├── index.md                     # About section
│   ├── about.md                     # About CCB
│   ├── contact.md                   # Contact information
│   ├── jobs.md                      # Job opportunities
│   └── publications.md              # Publications
│
├── _publications/                   # Publication data
│   ├── pmc.csv                      # PMC publications
│   ├── pmc.bib                      # PMC publications in BibTeX
│   └── doi.bib                      # Other publications in BibTeX
│
├── _people/                         # People data
│   ├── all.yaml                     # All people
│   ├── faculty.yaml                 # Faculty
│   ├── staff.yaml                   # Staff
│   ├── postdocs.yaml                # Postdoctoral researchers
│   ├── students.yaml                # Students
│   ├── collaborators.yaml           # Collaborators
│   ├── alumni.yaml                  # Alumni
│   └── people.schema.json           # People data schema
│
├── people/                          # People pages
│   ├── index.md                     # People section
│   ├── faculty.md                   # Faculty listing
│   ├── staff.md                     # Staff listing
│   ├── postdocs.md                  # Postdoctoral researchers
│   ├── students.md                  # Students
│   ├── collaborators.md             # Collaborators
│   ├── alumni.md                    # Alumni
│   └── alekseyz/                    # Individual people pages
│       ├── index.md                 # Front page
│       └── about.md                 # Additional pages ...
│
├── _software/                       # Software data
│   ├── all.yaml                     # All software
│   ├── alignment.yaml               # Alignment software
│   ├── gene-finding.yaml            # Gene-finding software
│   ├── genome-assembly.yaml         # Genome assembly software
│   ├── metagenomics.yaml            # Metagenomics software
│   ├── other-tools.yaml             # Other software
│   ├── transcriptome-assembly.yaml  # Transcriptome assembly software
│   ├── variant-analysis.yaml        # Variant analysis software
│   └── software.schema.json         # Software data schema
│
├── software/                        # Software pages
│   ├── index.md                     # Software section
│   ├── all.md                       # All software
│   ├── alignment.md                 # Alignment software
│   ├── gene_finding.md              # Gene-finding software
│   ├── genome_assembly.md           # Genome assembly software
│   ├── metagenomics.md              # Metagenomics software
│   ├── transcriptome_assembly.md    # Transcriptome assembly software
│   ├── variant_analysis.md          # Variant analysis software
│   └── other_tools.md               # Other software
│
├── _data/                           # Data metadata
│   ├── data.yaml                    # Data collections
│   ├── eupathdb.yaml                # EuPathDB data
│   └── data.schema.json             # Data schema
│
├── data/                            # Data pages
│   ├── index.md                     # Data section
│   ├── data.md                      # Data overview
│   ├── downloads.md                 # Data downloads
│   └── microbial.rst                # Microbial2025 database (RST format)
│   └── microbial.csv                # Microbial2025 statistics
│
├── education/                       # Education and training
│   ├── index.md                     # Education section
│   ├── courses.md                   # Courses
│   ├── information.md               # Program information
│   ├── internship.md                # Internships
│   ├── past_projects.md             # Past projects
│   └── sample_courses.md            # Sample courses
│
├── cbcc/                            # CBCC information
│   └── index.md                     # CBCC section
│
├── _templates/                      # Page templates
│   ├── page.html                    # Page layout and header/footer
│   ├── people.jinja                 # People page template
│   ├── software.html                # Software page template
│   └── data.jinja                   # Data page template
│
├── _static/                         # Static website files
│   ├── custom.css                   # Custom CSS
│   ├── custom.js                    # Custom JavaScript
│   ├── favicon.ico                  # Website favicon
│   ├── google5ed79d6dabf65a2d.html   # Google site verification
│   ├── robots.txt                   # Search-engine instructions
│   ├── images/                      # Website images
│   │   ├── campus2.jpeg             # Campus image
│   │   └── campus2-top.webp         # Website hero image
│   ├── logos/                       # CCB and JHU logos
│   └── people/                      # People photographs
│
├── .gitignore                       # Git ignore rules
│
├── .github/
│   └── workflows/
│       └── build-and-deploy.yml     # Build and deployment workflow
│
├── scripts/                         # Website automation scripts
│   └── build_markdown_pages.sh      # YAML validation and Markdown generation
│
└── _build/                          # Generated Sphinx output
```

> [!IMPORTANT]
> Some Markdown pages, including people, software and data listings, are generated automatically from YAML data. 
> **Do not edit generated files directly.** Edit the corresponding YAML source files instead.

---

## 6. Build the Website Locally

Before submitting changes, build and test the website locally.

### 6.1 Create a Python Virtual Environment

From the repository root:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

The virtual environment only needs to be created once.

### 6.2 Build the Website

The default theme is the PyData Sphinx Theme:

```bash
make clean  
make html
```

The generated website will be placed under:

```text
_build/pydata_sphinx_theme/
```

You can inspect the generated files with:

```bash
tree _build/pydata_sphinx_theme/
```

To build the website using a different theme (e.g., Furo):

```bash
make html html_theme=furo
```

### 6.3 View the Website

Open the main index page in your web browser:

```bash
xdg-open _build/pydata_sphinx_theme/index.html
```
---
	
## 7. Edit Website Content

The CCB website is built with **Sphinx** using **MyST Markdown**. Most content should be edited in the source files rather than in the generated HTML files.

> [!IMPORTANT]
> Any update should be followed by a website build and refresh 
> **Do not manually edit files under** **`_build/`**. They are generated files and will be overwritten by the next Sphinx build.

### 7.1 Explore the Website Structure

Sphinx uses `index.md` files as **landing pages** for the website and for individual sections.

```bash
ls -1 index.md */index.md 
```

```text
index.md
about/index.md
people/index.md
software/index.md
... 
```

The main `index.md` defines the top-level sections of the website using a hidden `toctree`.

```bash
cat index.md 
```

```text
:::{toctree}
:maxdepth: 1
:hidden:

About <about/index>
People <people/index>
Software <software/index>
...
:::
```

Individual sections can also have their own `index.md` files that define the pages belonging to that section.

For example, the `people/` directory contains an `index.md` along with other Markdown files:

```text
people/
├── index.md
├── faculty.md
├── students.md
├── alumni.md
└── ...
```

View the section's `index.md` with:

```bash
cat people/index.md
```

For example:

```text
---
title: People
---

:::{toctree}
:maxdepth: 2
:hidden:

faculty
students
alumni
...
:::
```

The `toctree` defines the pages that belong to the **People** section.
The entries correspond to Markdown files in the same directory, so `faculty` refers to `faculty.md`, `students` refers to `students.md`, and so on.

The `:hidden:` option makes these pages part of Sphinx's document tree and navigation structure without displaying the list of links directly on the `People` landing page.

### 7.2 Add a Markdown Page

To add a new page to a section:

Create the Markdown file. For example:

```bash
nano people/visitors.md
```

Add the page to the section's `index.md` `toctree`:

```text
:::{toctree}
:maxdepth: 2
:hidden:

faculty
postdocs
students
alumni
visitors
:::
```

---


### 7.3 Edit a Markdown Page

Website pages are stored as Markdown files:

```text
about/about.md
about/contact.md
software/alignment.md
...
```

To edit a Markdown page, open it with your preferred editor. For example:

```bash
nano about/jobs.md
```

A Markdown page may contain MyST syntax, such as labels, headings, substitutions, and cross-references:

```markdown
(jobs)=
# Open Positions at CCB

Most of the {{ CCB }} faculty members describe job openings on their
individual websites. See the {doc}`/people/faculty` page for those sites.
...
```

> [!IMPORTANT]
> The Markdown files under `people/`, `software/`, and `data/` are **generated files**. They are created from structured YAML data stored in `_people/`, `_software/`, and `_data/`, respectively, using the corresponding Jinja templates in `_templates/`.
>
> **Do not edit these generated Markdown files directly.** Instead, edit the appropriate YAML source file, validate it against the corresponding JSON schema, and regenerate the Markdown pages.
>
> The script `scripts/build_markdown_pages.sh` contains the commands for validating the YAML files and generating the Markdown pages.

For pages that are **not generated**, such as pages under `about/`, edit the Markdown file directly.

---

### 7.4 Edit and Query YAML Documents

Structured website content is stored in YAML files organized by type:

```text
_people/faculty.yaml
_software/alignment.yaml
_data/data.yaml
...
```

Edit a YAML file directly with a text editor. For example:

```bash
nano _people/faculty.yaml
```

A typical People record looks like this:

```yaml
people:
  - id: steven-l-salzberg
    name: Steven L. Salzberg, Ph.D.
    titles:
      - Bloomberg Distinguished Professor of Biomedical Engineering, Computer Science, and Biostatistics
      - Director, Center for Computational Biology
    affiliations:
      - bme
      - cs
      - bsph
    homepage: https://salzberg-lab.org
    email: salzberg@jhu.edu
    role: faculty
```

> [!NOTE]
> Lowercase values in `affiliations` (such as `bme`, `cs`, and `bsph`) correspond to substitutions defined by `myst_substitutions` in `conf.py`.
>
> The `id` value is used as a cross-reference label throughout the website. Follow the documented ID naming convention when adding or modifying records.

#### 7.4.1 Validate YAML Data

After editing a YAML file, validate it against the appropriate JSON Schema:

```bash
check-jsonschema \
    --schemafile _people/people.schema.json \
    _people/faculty.yaml
```

Always validate YAML files before committing changes. Schema validation helps catch missing fields, invalid values, and structural errors before the website is built.

#### 7.4.2 Query YAML Data

YAML files can also be inspected and queried from the command line using `yq`.

Examples of common queries are provided in the following reference documents:

* [People YAML Queries](README.People.md)
* [Software YAML Queries](README.Software.md)


--- 
### 7.5 Convert YAML to Markdown

The YAML files are the source for the generated People, Software and Data pages. 
Use the appropriate **Jinja** template to convert a **YAML** file into a **MyST Markdown** page.

For example, generate the Faculty page with:

```bash
jinja2 _templates/people.jinja _people/faculty.yaml \
    -D title="Faculty" \
    > people/faculty.md
```

Inspect the generated Markdown:

```bash
head -n 40 people/faculty.md 
```

The generated file will contain content similar to:

```text
  # Faculty 

  (steven-l-salzberg)=
  ## [Steven L. Salzberg, Ph.D.](https://salzberg-lab.org)

  ```{grid} 12
  :gutter: 1

  ::::{grid-item-card}
  :columns: 12 12 3 3

  :::{image} /_static/people/steven-l-salzberg.webp
  :width: 240px
  :alt: Steven L. Salzberg, Ph.D.
  :::
  ::::
  ...
```

> [!IMPORTANT]
> YAML is used as the source data because it makes structured content easier to **validate, format, sort, filter, and maintain**. 
> The Markdown pages are generated from this source data and should not be edited manually.

To regenerate all the pages, run:

```bash
./scripts/build_markdown_pages.sh
```

---

### 7.6 Cross-references

YAML IDs and MyST Markdown labels are used as cross-reference targets throughout the website. Each ID should follow the `first-name-middle-initial-last-name` format and remain consistent between the YAML source data and the generated Markdown pages.

For example, the YAML record might use:

```yaml
id: steven-l-salzberg
```

The generated Markdown page uses the same ID as a label:

```markdown
(steven-l-salzberg)=
## [Steven L. Salzberg, Ph.D.](https://salzberg-lab.org)
```

The label can then be referenced from other MyST Markdown pages using `{ref}`:

```text
{ref}`steven-l-salzberg`
{ref}`Salzberg <steven-l-salzberg>` Lab
```

The first form uses the text associated with the target label as the link text. The second form specifies custom link text.

> [!IMPORTANT]
> Keep IDs stable once they are used as cross-reference targets. Changing an ID requires updating all references to that ID throughout the website.

---

### 7.7 Substitutions

`{{ key }}` denotes a substitution defined in `conf.py`. Substitutions provide reusable names and URLs for departments, programs, organizations, and other values that appear throughout the website.

The substitution keys follow a simple naming convention:

* **Lowercase keys** - full name with a link
* **Uppercase keys** - abbreviation with a link

For example:

```bash
grep -A 5 myst_substitutions conf.py
```

```text
myst_substitutions = {
  "ARCH": "[ARCH](https://www.arch.jhu.edu/)",
  "bio":  "[Department of Biology](https://bio.jhu.edu/)",
  "bme":  "[Department of Biomedical Engineering](https://www.bme.jhu.edu/)",
  "BME":  "[BME](https://www.bme.jhu.edu/)",
  ...
}
```

A substitution can then be used in any Markdown or MyST page:

```markdown
{{ BME }}
{{ bme }}
```

For example, `{{ BME }}` renders as **BME**, while `{{ bme }}` renders as **Department of Biomedical Engineering**. Both link to the URL defined in `conf.py`.

Using substitutions keeps names and URLs **consistent throughout the website** and allows them to be updated in a single location.

---

### 7.8 Edit Templates

Reusable page structures are implemented with **Jinja2 templates**:
Templates define the layout and presentation of generated pages, allowing the same structure to be applied consistently to multiple YAML data files.

```text
_templates/page.html

_templates/people.jinja
_templates/software.jinja
_templates/data.jinja
```

> [!IMPORTANT]
> Templates should be modified when the structure or presentation of a group of generated pages needs to change.

### 7.9 Edit the Sphinx Configuration

`conf.py` contains the main Sphinx configuration and controls how the website is generated.

Important settings include:

- `html_theme` - selects the Sphinx theme.
- `html_baseurl` - defines the base URL of the website.
- `html_title` - sets the website title.
- `extensions` — enables Sphinx extensions used by the website.
- `myst_enable_extensions` - enables additional MyST Markdown features.
- `myst_substitutions` - defines reusable substitutions for names, organizations, URLs, and other values.
- `templates_path` - specifies the custom Jinja/Sphinx templates.
- `html_css_files` - loads custom CSS.
- `html_js_files` - loads custom JavaScript.
- `html_static_path` - makes files under `_static/` available to the build.
- `html_extra_path` - copies files such as `.nojekyll`, `robots.txt`, and Google verification files directly to the output.
- `redirects` - defines redirects for URLs from the old website.

> [!IMPORTANT]
> Use `conf.py` for **site-wide configuration and behavior**. Avoid duplicating the same configuration in individual Markdown pages when it can be defined once globally.

---
### 7.10 Edit CSS

Custom site styling is defined in:

```text
_static/custom.css
```

This file contains CSS classes and rules that customize the appearance of the selected Sphinx theme.

### 7.11 Edit JavaScript

Custom client-side behavior is defined in:

```text
_static/custom.js
```

Use this file for JavaScript functionality specific to the CCB website.

---

## 8. Review Your Changes

Before committing your changes, check which files have been modified:

```bash
git status
git diff
```
---

## 9. Commit or Undo Your Changes

Add the files you want to commit:

```bash
git add .
```

Review what will be committed:

```bash
git status
```

Create a commit:

```bash
git commit -m "Update website content"
```

Push the changes to your GitHub fork:

```bash
git push
```

Undoing Changes:

* **Uncommitted changes:** `git restore <file>`
* **Committed but not pushed:** `git reset HEAD~1`
* **Already pushed:** `git revert <commit>`

---

## 10. Automated Build and Deployment

The project uses **GitHub Actions** to automatically build and deploy the website to GitHub Pages.

The workflow is defined in:

```text
.github/workflows/build-and-deploy.yml
```

The main CCB repository is configured to build and deploy the website automatically.

### 10.1 Enable GitHub Actions

Open the **Actions** tab of your fork:

```text
https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu/actions
```

If GitHub displays a message indicating that workflows are disabled, click **Enable workflow**.

### 10.2 Configure GitHub Actions

Open the **Settings** tab of your fork and select **Actions/General**:

```text
https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu/settings/actions
```

Workflow permissions: click "Read and write permissions"

### 10.3 Configure GitHub Pages

Open the **Settings** tab  of your fork and select **Pages**:

```text
https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu/settings/pages
```

Under **Build and deployment**, set:

```text
Source: GitHub Actions
```

GitHub Actions may also require permission to write to the repository or deploy to GitHub Pages.

### 10.4 Run the Workflow

After enabling Actions and configuring GitHub Pages, go to:

```text
https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu/actions
```

Select **Build and Deplow Shinx** and click **Run workflow** if manual execution is available.

You can also trigger the workflow by pushing a changes `.github/workflows/build-and-deploy.yml`.

For example:

```bash
git add .
git commit -m "Update website"
git push
```

GitHub Actions will then build the website and, if the workflow and Pages settings are configured correctly, deploy it to GitHub Pages.

### 10.5 Monitor the Deployment

You can monitor workflow runs at:

```text
https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu/actions
```

A successful workflow should show a green check mark.

If the workflow fails, click the workflow run to see the build and deployment logs.

### 10.6 View the GitHub Pages Website

After a successful deployment, your fork should be available at:

```text
https://$GITHUB_USERNAME.github.io/www.ccb.jhu.edu/
```

> [!IMPORTANT]
> The GitHub Pages site for your fork is useful for testing changes before submitting a pull request.
> **Publishing your fork does not change the official CCB website.**
> Only changes merged into the main CCB repository are deployed to the official website.
> Make sure that the website builds successfully and our changes look correct in the local website.
---

To bookmark the website from the GitHub forked repository web page:  
Locate the `About` section on the right side of the main page, 
click the gear icon, and check the box for `Use your GitHub Pages website` under the Website section.

## 11. Submit Your Updates

Go to your GitHub repository:

```text
https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu
```

You should see a message similar to:

This branch is 1 commit ahead of `dpuiu/www.ccb.jhu.edu:main`.

Click on this message. GitHub will show that the branches can be automatically merged.

Click `Create pull request`. Include a short description of the changes you made.

All the active pull requests should be listed at:

```text
https://github.com/dpuiu/www.ccb.jhu.edu/pulls
```

---

## 12. Aprove the Updates

The changes are reviewed by the CCB website maintainers before they are merged.

Maintainers may:

- **Approve and merge** the pull request.
- **Request changes**.
- **Suggest improvements**.
- Ask for additional information or clarification.

Once the pull request is approved and merged, GitHub Actions will rebuild and deploy the website.
