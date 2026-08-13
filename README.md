# Contributing to the CCB Website

This repository contains the source files for the new [**Center for Computational Biology (CCB)**](https://ccb.jhu.edu/) website

```text
https://dpuiu.github.io/www.ccb.jhu.edu/
```

The website is built with [**Sphinx**](https://www.sphinx-doc.org/) and the [**PyData Sphinx Theme**](https://pydata-sphinx-theme.readthedocs.io/).
The website content is written in [**MyST Markdown**](https://mystmd.org/), an enhanced version of [**Markdown**](https://www.markdownguide.org/) that provides additional features for technical and scientific documentation.
The repository also contains [**YAML**](https://yaml.org/) files for structured website data and [**WebP**](https://developers.google.com/speed/webp) images used throughout the website.

**We welcome contributions from CCB collaborators and lab members**.
You can help improve the website by editing files and submitting a **pull request**.
All changes are **reviewed** before they are **merged and published to the website**.

---

# Note on Sphinx

**Sphinx**  is the documentation generator used to build the CCB website from Markdown and configuration files.
It automatically generates many parts of the website, so navigation and common site functionality do not need to be maintained manually.

For example, Sphinx automatically provides:

- **Navigation** - builds the site structure from the document hierarchy and `toctree` directives.
- **Search** - generates the search index and search interface.
- **Table of contents** - creates navigation from document and section structure.
- **Cross-references** - generates links between pages, sections, and other documented objects.
- **Permalinks** - creates stable URLs for sections and pages.
- **HTML pages** - converts the source Markdown files into the final HTML website.
- **Theme integration** - applies the selected Sphinx theme to the generated pages.
- **Static assets** - processes and copies CSS, JavaScript, images, and other static files.

The `_build/` directory contains the generated website. Source files should be edited instead of the generated HTML files.

The overall workflow is:

```text
YAML + MyST Markdown + Jinja templates + conf.py + WebP
                         ↓
                       Sphinx
                         ↓
                      _build/
                         ↓
                    Web website
```

---

## 1. Fork the Repository

Using a web browser:

1. Log in to **GitHub**.

2. Navigate to the CCB website repository: `https://github.com/dpuiu/www.ccb.jhu.edu`

3. Click **Fork** in the upper-right corner to create your own copy of the repository under your GitHub account.

If you already have a fork, open your forked repository and click **Sync fork** to update it with the latest changes from the original repository. You can make changes in your fork and submit them back to the main repository through a **pull request**.

---

## 2. Check That Required Tools Are Installed

Open a terminal and check that Python, Git, and the GitHub CLI are available:

```bash
python --version
git --version
gh --version
```

If any of these tools are missing, you can install them on Ubuntu with:

```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv \
  python-is-python3 git gh yq
```

---

## 3. Log In to GitHub

Authenticate the GitHub CLI:

```bash
gh auth login
gh auth status
```

Then get your GitHub username:

```bash
GITHUB_USERNAME=$(gh api user --jq .login)
echo $GITHUB_USERNAME
```

Set username and email:

```bash
git config --global user.name "..."
git config --global user.email "..."
git config --list
```

---

## 4. Clone Your Fork

### 4.1 First Time: Clone the Repository

If you have not cloned the repository before:

```bash
git clone https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu.git
cd www.ccb.jhu.edu
```

### 4.2 Existing Clone: Update Your Local Repository

If you already have a local clone:

```bash
cd www.ccb.jhu.edu
git pull
```

It is a good idea to update your local repository before starting new work.

---

## 5. Repository Structure

The repository is organized by website section. Most website content is written in MyST Markdown (`.md`).

You can view the structure with:

```bash
tree .
```

The main directories and files are:

```text
.
├── index.md                         # Main website page
├── conf.py                          # Sphinx configuration
├── Makefile                         # Build commands
├── requirements.txt                 # Python/Sphinx dependencies
├── README.md                        # Project documentation
│
├── about/                           # General CCB information
│   ├── index.md
│   ├── about.md
│   ├── contact.md
│   └── jobs.md
│
├── people/                          # People pages
│   ├── index.md
│   ├── faculty.md                   # Generated; do not edit directly
│   ├── staff.md                     # Generated; do not edit directly
│   ├── postdocs.md                  # Generated; do not edit directly
│   ├── students.md                  # Generated; do not edit directly
│   ├── collaborators.md             # Generated; do not edit directly
│   └── alumni.md                    # Generated; do not edit directly
|   ├── alekseyz                     # Personal pages
│   │   ├── about.md
│   │   ├── index.md
|   |   | .....
│
├── education/                       # Education and training
│   ├── index.md
│   ├── courses.md
│   ├── information.md
│   ├── internship.md
│   ├── past_projects.md
│   └── sample_courses.md
│
├── software/                        # Software documentation
│   ├── index.md
│   ├── alignment.md
│   ├── gene_finding.md
│   ├── genome_assembly.md
│   ├── metagenomics.md
│   ├── transcriptome_assembly.md
│   ├── variant_analysis.md
│   └── other_tools.md
│
├── data/                            # Data resources and downloads
│   ├── index.md
│   ├── data.md
│   ├── downloads.md
│   └── eupathdb.md
│
├── cbcc/                            # CBCC information
│   └── index.md
│
├── _people/                         # Structured people data
│   ├── faculty.yaml                 # Edit this file
│   ├── staff.yaml
│   ├── postdocs.yaml
│   ├── students.yaml
│   ├── collaborators.yaml
│   ├── alumni.yaml
│   └── people.schema.json           # JSON Schema for validation
│
├── _templates/                      # Jinja/Sphinx templates
│   ├── page.html                    # Custom page template
│   └── people.jinja                 # People page template
│
├── _static/                         # Static files copied to the website
│   ├── custom.css                   # Custom CSS
│   ├── custom.js                    # Custom JavaScript
│   ├── favicon.ico                  # Website favicon
│   ├── google5ed79d6dabf65a2d.html  # Google site verification
│   ├── robots.txt                   # Search-engine instructions
│   ├── images/                      # Website and carousel images
│   ├── logos/                       # CCB/JHU logos
│   ├── people/                      # People photos
│   └── maps/                        # Campus/JHH maps
│
├── .gitignore                       # Git files/directories to ignore
│
├── .github/
│   └── workflows/
│       └── deploy.yml               # GitHub Actions build/deployment
│
└── _build/                          # Generated Sphinx output (not committed)
```

> [!IMPORTANT]
> Files under `people/` such as `faculty.md`, `staff.md`, and `students.md` are generated from structured data stored under `_people/`.
> **Do not edit the generated people pages directly.**
> Instead, edit the corresponding YAML file under `_people/` and regenerate the Markdown page.

---

## 6. Build the Website Locally

Before submitting changes, build and test the website locally.

### 6.1 Create a Python Virtual Environment

From the repository root:

```bash
python -m venv .venv
source .venv/bin/activate
```

The virtual environment only needs to be created once.

### 6.2 Install Website Dependencies

Install the required Python packages:

```bash
pip install -r requirements.txt
```

### 6.3 Build the Website

The default theme is the PyData Sphinx Theme:

```bash
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

```text
_build/pydata_sphinx_theme/
├── index.html
├── _static/
└── ...
```

To build the website using a different theme (e.g., Furo):

```bash
make html html_theme=furo
```

### 6.4 Start a Local Web Server

Serve the generated website directly from `_build/pydata_sphinx_theme`:

```bash
python -m http.server 8000 \
    --bind 127.0.0.1 \
    -d _build/pydata_sphinx_theme/
```

Open the website in a browser:

```text
http://127.0.0.1:8000/
```

Keep the server running while you make changes. After rebuilding the website, refresh the browser to see the updated pages.

---

## 7. Edit Website Content

The CCB website is built with **Sphinx** using **MyST Markdown**. Most content should be edited in the source files rather than in the generated HTML files.

> [!IMPORTANT]
> Any update should be followed by a `make html` and website refresh
> **Do not manually edit files under** **`_build/`**. They are generated files and will be overwritten by the next Sphinx build.

### 7.1 View the Structure

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

### 7.3 Edit a Markdown Page

Website pages are stored as Markdown files:

```text
about/about.md
about/contact.md
software/alignment.md
...
```

Edit a page with your preferred editor:

```bash
head software/alignment.md 
```

```text
# Alignment

## [Bowtie](https://bowtie-bio.sourceforge.net/index.shtml)

An ultrafast, memory-efficient short read aligner that aligns short DNA
sequences to the human genome at a rate of about 25 million reads per hour on a
typical desktop computer. Bowtie indexes the genome with a Burrows-Wheeler index
to keep its memory footprint small: 2.3 GB for the human genome. Bowtie and
Bowtie2 were developed by Ben Langmead and are actively supported by his lab.  
...
```

### 7.4 Edit YAML Documents

People pages are generated from YAML data files stored under `_people/`. Do **not** edit the generated Markdown pages directly.

For example:

```text
_people/faculty.yaml
_people/students.yaml
_people/alumni.yaml
...
```

```bash
head _people/faculty.yaml -n 20
```

```text
people:
  - id: steven-l-salzberg
    name: Steven L. Salzberg, Ph.D.
    image: /_static/people/steven-l-salzberg.webp
    titles:
      - Bloomberg Distinguished Professor of Biomedical Engineering, Computer Science, and Biostatistics
      - Director, Center for Computational Biology
    affiliations:
      - bme
      - cs
      - bsph
    homepage: https://salzberg-lab.org
    email: salzberg@jhu.edu
```

Edit the data:

```bash
nano _people/faculty.yaml
```

Validate the YAML against the schema:

```bash
check-jsonschema \
    --schemafile _people/people.schema.json \
    _people/faculty.yaml
```

Generate the corresponding Markdown page using the Jinja2 template:

```bash
jinja2 _templates/people.jinja _people/faculty.yaml \
    -D title="Faculty" \
    > people/faculty.md
```

```bash
head -n 40 people/faculty.md 
```

````text
# Faculty 

(steven-l-salzberg)=
## Steven L. Salzberg, Ph.D.

```{grid} 12
:gutter: 1

::::{grid-item-card}
:columns: 12 12 3 3

:::{image} /_static/people/steven-l-salzberg.webp
:width: 240px
:alt: Steven L. Salzberg, Ph.D.
:::

::::

::::{grid-item-card}
:columns: 12 12 9 9

**Bloomberg Distinguished Professor of Biomedical Engineering, Computer Science, and Biostatistics**  
**Director, Center for Computational Biology**  

{{ bme }}  
{{ cs }}  
{{ bsph }}  

[Homepage](https://salzberg-lab.org)  
[salzberg@jhu.edu](mailto:salzberg@jhu.edu) 

::::
````

> [!IMPORTANT]
> People IDs are cross-referenced throughout the website and should follow the first_name-middle_initial-last_name format.
> `{{ \w+ }}` corresponds to substitutions defined in `conf.py`. These substitutions use common names for values such as department names and URLs that are reused throughout the website.

```bash
grep -A 5 myst_substitutions  conf.py 
```

```text
myst_substitutions = {
  "ARCH": "[ARCH](https://www.arch.jhu.edu/)",
  "bio":  "[Department of Bilogy](https://bio.jhu.edu/)",
  "bme":  "[Department of Biomedical Engineering](https://www.bme.jhu.edu/)",
  "BME":  "[BME](https://www.bme.jhu.edu/)",
  "bsph": "[Department of Biostatistics](https://publichealth.jhu.edu/departments/biostatistics)",
  ...
```

YAML advantages: validation, reformating, sorting, filtering ...

Example: extract names

```bash
yq '.people[].name' _people/faculty.yaml | head -n 3
```

```text
"Steven L. Salzberg, Ph.D."
"Dan Arking, Ph.D."
"Joel Bader, Ph.D."
...
```

Example: sort records and fields
```bash
yq -y '.people |= sort_by(.id)' _people/faculty.yaml
yq -y '.people |= map({id, name, titles, affiliations, departments, labs})' _people/faculty.yaml 
```

### 7.5 Edit Templates

Reusable page structures are implemented with **Jinja2 templates** under:

```text
_templates/page.html
_templates/people.jinja
```

> [!IMPORTANT]
> Templates should be modified when the structure or presentation of a group of generated pages needs to change.
> Individual data records should remain in the YAML files.

### 7.6 Edit the Sphinx Configuration

`conf.py` contains the main Sphinx configuration and controls how the website is generated.

Important settings include:

- `html_theme` - selects the Sphinx theme from the `html_theme` environment variable.
- `templates_path` - specifies the custom Jinja/Sphinx templates.
- `html_baseurl` - defines the base URL of the website.
- `html_css_files` - loads custom CSS.
- `html_js_files` - loads custom JavaScript.
- `html_static_path` - makes files under `_static/` available to the build.
- `html_extra_path` - copies files such as `.nojekyll`, `robots.txt`, and Google verification files directly to the output.
- `html_title` - sets the website title.
- `html_favicon` - specifies the favicon.
- `html_search` - enables Sphinx's generated search functionality.
- `html_permalinks` - enables section permalinks.
- `html_context` - provides variables to Jinja templates.
- `redirects` - defines redirects for URLs from the old website.

Site-wide behavior should be configured here rather than duplicated in individual Markdown pages.

### 7.7 Edit CSS

Custom site styling is defined in:

```text
_static/custom.css
```

This file contains CSS classes and rules that customize the appearance of the selected Sphinx theme.

### 7.8 Edit JavaScript

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

## 9. Commit/Undo Your Changes

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

To undo changes:

- **Not pushed:** `git reset`
- **Already pushed:** `git revert`

---

## 10. GitHub Actions and Deployment

The project uses **GitHub Actions** to build and deploy the website to GitHub Pages.

The workflow is defined in:

```text
.github/workflows/deploy.yml
```

The main CCB repository is configured to build and deploy the website automatically.
However, **GitHub Actions and GitHub Pages may not be enabled or configured automatically when you create a fork**.

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

Select the deployment workflow and click **Run workflow** if manual execution is available.

You can also trigger the workflow by pushing a change to the branch configured in `.github/workflows/deploy.yml`.

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

### 10.6 Your GitHub Pages Website

After a successful deployment, your fork should be available at:

```text
https://$GITHUB_USERNAME.github.io/www.ccb.jhu.edu/
```

> [!IMPORTANT]
> The GitHub Pages site for your fork is useful for testing changes before submitting a pull request.
> **Publishing your fork does not change the official CCB website.**
> Only changes merged into the main CCB repository are deployed to the official website.

---

## 11. Submit a Pull Request

After pushing your changes to your fork, open a pull request from your fork to the main CCB website repository:

```text
https://github.com/dpuiu/www.ccb.jhu.edu/pulls
```

Include a short description of what you changed.
Before submitting the pull request, make sure that the website builds successfully and our changes look correct in the local website.

---

## 12. Review Process

All changes are reviewed by the CCB website maintainers before they are merged.

Maintainers may:

- **Approve and merge** the pull request.
- **Request changes**.
- **Suggest improvements**.
- Ask for additional information or clarification.

Once the pull request is approved and merged, GitHub Actions will rebuild and deploy the website.
