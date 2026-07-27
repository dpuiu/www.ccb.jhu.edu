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
git clone https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu.git
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
 │   ├── Maps/             # Campus maps
 │   └── People/           # Faculty, staff, and student pictures
 
 ├── About/                # About CCB, publications, contact
 ├── People/               # Faculty, staff, postdocs, students, alumni
 │   └── alekseyz/         # Example: individual profile
 ├── Software/             # Software developed by CCB
 ├── Data/                 # Databases developed by CCB
 ├── Education/            # PhD program and courses
 ├── CBCC/                 # Consulting Core
 
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

# View the generated files:
tree _build
 _build/
 └── html/
 ├── index.html
 ├── _static/
 └── ...

# Start a local web server ona  local port:
python -m http.server 8000 --bind 127.0.0.1 -d _build/pydata_sphinx_theme/
#python -m http.server 8001 --bind 127.0.0.1 -d _build/furo/
```

Open the website in a browser:

  http://127.0.0.1:8000/

## 6. Edit Website Content

Pages are written in [Myst Markdown](https://mystmd.org/)

Examples:

```text
About/about.md
People/faculty.md
People/students.md
```

Edit with your preferred editor (Ex nano):

```bash
nano People/faculty.md
```
---

## 7. Generate the Website

In the terminal: 

```bash
make html
```

In the browser:

Refresh:
  http://127.0.0.1:8000/index.html

---

## 7b. Manually Edit the Website (should be avoided)

```bash
nano _build/pydata_sphinx_theme/<file_name>
```

In the browser:

Refresh:
  http://127.0.0.1:8000/index.html

---

## 8. Commit Your Changes

In the terminal:

```bash
cp -r _build/pydata_sphinx_theme/ docs
git status
git add .
git commit -m "Update website content"
git push
```
---

## 9. Setting GitHub Actions & Deployment

This project uses GitHub Actions to build the website automatically. 
Updates triger page build

  https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu/settings/pages

Set: Build and deployment, Source="GitHub Action"

Monitor builds:

  https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu/actions  

Site:

  https://$GITHUB_USERNAME.github.io/www.ccb.jhu.edu/

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

