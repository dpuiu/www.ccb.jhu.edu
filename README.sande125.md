# Contributing to the CCB Website

This repository contains the source files for the **Center for Computational Biology (CCB) website**, built with **Sphinx and the PyData Theme**:

<https://dpuiu.github.io/www.ccb.jhu.edu/>

The official CCB website is available at:

<https://ccb.jhu.edu/>

We welcome contributions from CCB collaborators and lab members. You can help
improve the website by editing MyST Markdown (`.md`) files and submitting a
pull request.

All changes are reviewed before being merged and published to the website.

---

## 1. Fork the Repository

Using a web browser:

1. Log in to GitHub.
2. Navigate to the CCB website repository:

   <https://github.com/dpuiu/www.ccb.jhu.edu>

3. Click **Fork** in the upper-right corner to create your own copy of the repository under your GitHub account.

You can make changes in your fork and submit them back to the main repository through a pull request.

---

## 2. Check if Python, Git, and GitHub CLI Are Installed

Open a terminal and check that the required tools are available:

```bash
python --version
git --version
gh --version
```

If any of these tools are missing, install them (Ubuntu example):

```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv python-is-python3 git gh
```
---
 
## 3. Login to GitHub

Authenticate the GitHub CLI, verify that you are logged in, get your GitHub username, clone your fork of the CCB website repository:

```bash
gh auth login
GITHUB_USERNAME=$(gh api user --jq .login)
```

---

## 3a. Clone the Repo (1st time)

```bash
git clone https://github.com/sande125/www.ccb.jhu.edu.git
cd www.ccb.jhu.edu
```

---
## 3b. Bring The Local Repo Up To Date

```bash
cd www.ccb.jhu.edu
git pull
```

---

## 4. Repository Structure

The repository is organized by website section. Most content is written in MyST Markdown (`.md`) .

In the terminal:

```bash
tree .

 .
 ├── index.md              # Website home page
 ├── conf.py               # Sphinx configuration
 ├── Makefile              # Build commands
 ├── README.md             # Repository documentation
     _templates/           # Sphinx templates
 
 ├── _static/              # Static files
 │   ├── custom.css        # Custom CSS
 │   ├── custom.js         # Custom JavaScript
 │   ├── Logos/            # JHU logos
 │   ├── maps/             # Campus maps
 │   └── people/           # Faculty, staff, and student pictures
 
 ├── about/                # About CCB, publications, contact
 ├── people/               # Faculty, staff, postdocs, students, alumni
 │   └── alekseyz/         # Example: individual profile
 ├── software/             # Software developed by CCB
 ├── data/                 # Databases developed by CCB
 ├── education/            # PhD program and courses
 ├── cbcc/                 # Consulting Core
 
 ├── _build/                       # Build directory, contains html files
 ├── .github/workflows/deploy.yml  # Automatic build pipeline
```

---

## 5. Build the Website Locally

Before submitting changes, build and test the website locally.

In the terminal:

```bash
# Create and activate a Python virtual environment:
python -m venv .venv
source .venv/bin/activate

# Install website dependencies:
pip install -r requirements.txt

# Build the website:
make html                   # using the default pydata_sphinx_theme theme
#make html html_theme=furo  # using another theme

# Copy the files to docs:
cp -r _build/pydata_sphinx_theme/ docs/

# View the generated files:
tree docs/
 docs/
 ├── index.html
 ├── _static/
 └── ...

# Start a local web server ona  local port:
python -m http.server 8000 --bind 127.0.0.1 -d docs/
```

Open the website in a browser:

  http://127.0.0.1:8000/

## 6. Edit Website Content

Pages are written in [Myst Markdown](https://mystmd.org/)

Examples:

```text
about/about.md
people/faculty.md
software/alignment.md
...

```

Edit one page with your preferred editor (Ex nano):

```bash
nano software/alignment.md
```

Rerun the make, copy commands

```bash
make html
cp -r _build/pydata_sphinx_theme/ docs/
```

In the browser:

Refresh:
  http://127.0.0.1:8000/software/alignment.html

---

## 7b. Edit the HTML pages (should be avoided)

Example: The Alignment Software Website

```bash

ls -ll software/alignment.md docs/software/alignment.html 
-rw-rw-r-- 1 dpuiu dpuiu 27548 Jul 27 16:51 docs/software/alignment.html   # much bigger than the MarkDown 
-rw-rw-r-- 1 dpuiu dpuiu  4406 Jul 17 13:40 software/alignment.md          

nano docs/software/alignment.html
```

In the browser:

Refresh:
  http://127.0.0.1:8000/software/alignment.html

---

## 8. Commit Your Changes

In the terminal:

```bash
git status
git add .
git commit -m "Update website content"
git push
```
---

## 9. Setting GitHub Actions & Deployment

This project uses GitHub Actions to build the website automatically. 
Updates triger page build

  https://github.com/sande125/www.ccb.jhu.edu/settings/pages

Set: Build and deployment, Source="GitHub Action"

Monitor builds:

  https://github.com/sande125/www.ccb.jhu.edu/actions  

Site:

  https://sande125.github.io/www.ccb.jhu.edu/

---

## 10. Merge changes

If happy with the edits, open a Pull Request here:

  https://github.com/dpuiu/www.ccb.jhu.edu/pulls

Include a short description of your changes.

---

## 11. Review Process

All changes are reviewed by maintainers.

They may:

- Approve and merge
- Request changes
- Suggest improvements

