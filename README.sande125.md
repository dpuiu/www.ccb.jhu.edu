# Contributing to the CCB Website

This repository contains the source files for the **Center for Computational Biology (CCB) website**, built with **Sphinx** and the **PyData Sphinx Theme**:

https://dpuiu.github.io/www.ccb.jhu.edu/

The official CCB website is available at:

https://ccb.jhu.edu/

We welcome contributions from CCB collaborators and lab members. You can help improve the website by editing MyST Markdown (`.md`) files or structured data files and submitting a pull request.

All changes are reviewed before they are merged and published to the website.

---

# Note on Sphinx


Sphinx is the documentation generator used to build the CCB website from Markdown and configuration files. It automatically generates many parts of the website, so navigation and common site functionality do not need to be maintained manually.

For example, Sphinx automatically provides:

* **Navigation** — builds the site structure from the document hierarchy and `toctree` directives.
* **Search** — generates the search index and search interface.
* **Table of contents** — creates navigation from document and section structure.
* **Cross-references** — generates links between pages, sections, and other documented objects.
* **Permalinks** — creates stable URLs for sections and pages.
* **HTML pages** — converts the source Markdown files into the final HTML website.
* **Theme integration** — applies the selected Sphinx theme to the generated pages.
* **Static assets** — processes and copies CSS, JavaScript, images, and other static files.

The `_build/html` directory contains the generated website. Source files should be edited instead of the generated HTML files.

The overall workflow is:

```text
Markdown + Jinja templates + conf.py
                  ↓
                Sphinx
                  ↓
          _build/html/
                  ↓
             Web website
```

---

## 1. Fork the Repository

Using a web browser:

1. Log in to GitHub.

2. Navigate to the CCB website repository:

   https://github.com/dpuiu/www.ccb.jhu.edu

3. Click **Fork** in the upper-right corner to create your own copy of the repository under your GitHub account.

If you already have a fork, open your forked repository and click **Sync fork** to update it with the latest changes from the original repository.

You can make changes in your fork and submit them back to the main repository through a pull request.

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
sudo apt install python3 python3-pip python3-venv python-is-python3 git gh
```

---

## 3. Log In to GitHub

Authenticate the GitHub CLI:

```bash
gh auth login
```

Then get your GitHub username:

```bash
GITHUB_USERNAME=$(gh api user --jq .login)
echo $GITHUB_USERNAME
```

---

## 4. Clone Your Fork

### 4.1 First Time: Clone the Repository

If you have not cloned the repository before:

```bash
git clone https://github.comsande125/www.ccb.jhu.edu.git
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
├── scripts/                         # Utility/build scripts
│   └── make_people.py               # Process/validate people data
│
├── .gitignore                       # Git files/directories to ignore
│
├── .github/
│   └── workflows/
│       └── deploy.yml               # GitHub Actions build/deployment
│
└── _build/                          # Generated Sphinx output (not committed)
```

### Important: Generated People Pages

Files under `people/` such as `faculty.md`, `staff.md`, and `students.md` are generated from structured data stored under `_people/`.

**Do not edit the generated people pages directly.**

Instead, edit the corresponding YAML file under `_people/` and regenerate the Markdown page.

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

If the virtual environment already exists and you have activated it, you can simply run:

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

For example:

```text
_build/pydata_sphinx_theme/
├── index.html
├── _static/
└── ...
```

To build using the Furo theme instead:

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

http://127.0.0.1:8000/

For example:

http://127.0.0.1:8000/software/alignment.html

There is no need to copy the generated files to a separate `docs/` directory.

Keep the server running while you make changes. After rebuilding the website, refresh the browser to see the updated pages.

---

## 7. Edit Website Content

The CCB website is built with **Sphinx** using **MyST Markdown**. Most content should be edited in the source files rather than in the generated HTML files.

### 7.1 Edit a Markdown Page

Website pages are stored as Markdown files:

```text
about/about.md
about/contact.md
people/faculty.md
software/alignment.md
```

Edit a page with your preferred editor:

```bash
nano about/contact.md
```

After making changes, rebuild the website:

```bash
make html
```

Start the local web server if it is not already running:

```bash
python -m http.server 8000 --directory _build/html
```

Then open the corresponding page in your browser:

```text
http://127.0.0.1:8000/about/contact.html
```

Sphinx automatically generates the HTML, navigation, search index, table of contents, permalinks, and other site components during the build.

### 7.2 Edit People Data

People pages are generated from YAML data files stored under `_people/`. Do **not** edit the generated Markdown pages directly.

For example:

```text
_people/faculty.yaml
_people/staff.yaml
_people/postdocs.yaml
_people/students.yaml
_people/collaborators.yaml
_people/alumni.yaml
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

The generated Markdown file can then be processed by Sphinx:

```bash
make html
```

The workflow is:

```text
_people/faculty.yaml
        ↓
   Jinja2 template
        ↓
 people/faculty.md
        ↓
      Sphinx
        ↓
 _build/html/people/faculty.html
```

The same process is used for all people categories.

### 7.3 Edit Templates

Reusable page structures are implemented with **Jinja2 templates** under:

```text
_templates/
```

For example:

```text
_templates/people.jinja
```

Templates should be modified when the structure or presentation of a group of generated pages needs to change. Individual data records should remain in the YAML files.

### 7.4 Edit the Sphinx Configuration

`conf.py` contains the main Sphinx configuration and controls how the website is generated.

Important settings include:

* `html_theme` — selects the Sphinx theme from the `html_theme` environment variable.
* `templates_path` — specifies the custom Jinja/Sphinx templates.
* `html_baseurl` — defines the base URL of the website.
* `html_css_files` — loads custom CSS.
* `html_js_files` — loads custom JavaScript.
* `html_static_path` — makes files under `_static/` available to the build.
* `html_extra_path` — copies files such as `.nojekyll`, `robots.txt`, and Google verification files directly to the output.
* `html_title` — sets the website title.
* `html_favicon` — specifies the favicon.
* `html_search` — enables Sphinx's generated search functionality.
* `html_permalinks` — enables section permalinks.
* `html_context` — provides variables to Jinja templates.
* `redirects` — defines redirects for URLs from the old website.

Site-wide behavior should be configured here rather than duplicated in individual Markdown pages.

### 7.5 Edit CSS

Custom site styling is defined in:

```text
_static/custom.css
```

This file contains CSS classes and rules that customize the appearance of the selected Sphinx theme.

For example, changes to layout, spacing, fonts, colors, navigation, or other visual elements should generally be made here rather than directly modifying the theme's files.

### 7.6 Edit JavaScript

Custom client-side behavior is defined in:

```text
_static/custom.js
```

Use this file for JavaScript functionality specific to the CCB website.

Both `custom.css` and `custom.js` are included through `conf.py`:

```python
html_css_files = [
    "custom.css",
]

html_js_files = [
    "custom.js",
]
```

After changing `conf.py`, templates, CSS, JavaScript, or generated Markdown, rebuild the website:

```bash
make html
```

The generated website is placed under:

```text
_build/html/
```

**Do not manually edit files under `_build/html/`**. They are generated files and will be overwritten by the next Sphinx build.

---

## 8. Review Your Changes

Before committing your changes, check which files have been modified:

```bash
git status
```

Review the actual changes:

```bash
git diff
```

Make sure that:

* You modified the correct source files.
* Generated files under `_build/` are not being committed.
* You did not accidentally modify unrelated files.
* The website builds without errors.
* The modified pages look correct in the local website.

You can check whether `_build/` is ignored by Git with:

```bash
git status --ignored
```

---

## 9. Commit Your Changes

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

---

## 10. GitHub Actions and Deployment

The project uses **GitHub Actions** to build and deploy the website to GitHub Pages.

The workflow is defined in:

```text
.github/workflows/deploy.yml
```

The main CCB repository is configured to build and deploy the website automatically. However, **GitHub Actions and GitHub Pages may not be enabled or configured automatically when you create a fork**.

If you want to build and publish your own fork as a GitHub Pages website, you may need to configure it first.

### 10.1 Enable GitHub Actions

Open the **Actions** tab of your fork:

https://github.comsande125/www.ccb.jhu.edu/actions

If GitHub displays a message indicating that workflows are disabled, enable workflows for the repository.

The workflow should then appear under **Actions**.

You can also open the workflow directly:

https://github.comsande125/www.ccb.jhu.edu/actions/workflows/deploy.yml

If necessary, click **Enable workflow**.

### 10.2 Configure GitHub Pages

Open the **Pages** settings for your fork:

https://github.comsande125/www.ccb.jhu.edu/settings/pages

Under **Build and deployment**, set:

```text
Source: GitHub Actions
```

Do **not** select **Deploy from a branch** if the `deploy.yml` workflow is configured to deploy the site using GitHub Actions.

### 10.3 Check Workflow Permissions

GitHub Actions may also require permission to write to the repository or deploy to GitHub Pages.

Open:

https://github.comsande125/www.ccb.jhu.edu/settings/actions

Check the **Workflow permissions** section.

If the workflow requires write access, select:

```text
Read and write permissions
```

and save the settings.

The exact permissions required depend on the deployment configuration in `.github/workflows/deploy.yml`.

### 10.4 Run the Workflow

After enabling Actions and configuring GitHub Pages, go to:

https://github.comsande125/www.ccb.jhu.edu/actions

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

https://github.comsande125/www.ccb.jhu.edu/actions

A successful workflow should show a green check mark.

If the workflow fails, click the workflow run to see the build and deployment logs.

### 10.6 Your GitHub Pages Website

After a successful deployment, your fork should be available at:

https:/sande125.github.io/www.ccb.jhu.edu/

For example, if your GitHub username is `jsmith`:

```text
https://jsmith.github.io/www.ccb.jhu.edu/
```

The official CCB website is:

https://ccb.jhu.edu/

### Important

The GitHub Pages site for your fork is useful for testing changes before submitting a pull request. **Publishing your fork does not change the official CCB website.**

Only changes merged into the main CCB repository are deployed to the official website.

---

## 11. Submit a Pull Request

After pushing your changes to your fork, open a pull request from your fork to the main CCB website repository:

https://github.com/dpuiu/www.ccb.jhu.edu/pulls

Include a short description of what you changed.

For example:

```text
Updated the software alignment page to add information
about the latest versions of BWA and HISAT2.
```

Before submitting the pull request, make sure that:

* The website builds successfully.
* Your changes look correct in the local website.
* You did not modify generated files unnecessarily.
* You committed the intended files.
* The pull request description clearly explains your changes.

---

## 12. Review Process

All changes are reviewed by the CCB website maintainers before they are merged.

Maintainers may:

* **Approve and merge** the pull request.
* **Request changes**.
* **Suggest improvements**.
* Ask for additional information or clarification.

Once the pull request is approved and merged, GitHub Actions will rebuild and deploy the website.
