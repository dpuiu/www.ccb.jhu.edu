# Contributing to the CCB Website

This repository contains the source files for the draft **Center for Computational
Biology (CCB) website**, built with **Sphinx and the PyData Theme**:

https://dpuiu.github.io/www.ccb.jhu.edu/

The official CCB website is:

https://ccb.jhu.edu/

We welcome contributions from CCB collaborators and lab members. You can help
improve the website by editing MyST Markdown (`.md`) files and submitting a
Pull Request.

All changes are reviewed before being merged and published.

---

# Workflow Overview

1. Fork the repository
2. Clone your fork locally
3. Create a new branch
4. Edit website content
5. Build and test the website locally
6. Commit and push your changes
7. Open a Pull Request
8. A CCB maintainer reviews and merges your changes
9. GitHub Actions automatically rebuilds and deploys the website

---

# 1. Fork the Repository

Using a web browser:

1. Login to GitHub
2. Navigate to:

   https://github.com/dpuiu/www.ccb.jhu.edu

3. Click **Fork** to create your own copy of the repository.

---

# 2. Login to GitHub and Clone Your Fork

In the terminal:

```bash
gh auth login

GITHUB_USERNAME=$(gh api user --jq .login)

git clone https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu.git

cd www.ccb.jhu.edu
```

______________________________________________________________________

## 3. Create a Development Branch

Always work on a separate branch (do not commit directly to main):

In the terminal:

```bash
git checkout -b site-update
```

______________________________________________________________________

## 4. Repository Structure

The repository is organized by website section. Most content is written in
MyST Markdown (`.md`) .

In the terminal:

```bash
tree www.ccb.jhu.edu/
├── index.md            # Website home page
├── conf.py             # Sphinx configuration
├── Makefile            # Makefile
├── README.md           # This file

├── _static/            # static files
├── _static/custom.css  # CSS
├── _static/custom.js   # JavaScripts

├── _static/Logos/      # JHU logos
├── _static/Maps/       # campus maps
├── _static/People      # faculty, students, ... pictures

├── About/            # About CCB, Publications, Contact
├── People/           # Faculty, staff, postdocs, students, alumni
├── People/alekseyz/  # Example: individual profiles
├── Software/         # Software developed by CCB
├── Data/             # Databases developed by CCB
├── Education/        # The Ph.D. program, courses
├── CBCC/             # Consulting Core  
 
├── Examples/         # Markdown/MyST tested examples (tables,grids,images,layouts...)
```

______________________________________________________________________

## 4 Build Website locally

In the terminal:

```bash

# Check Python:
python -v

# Create a virtual environment:
python -m venv .venv
. .venv/bin/activate
pip install -f requirements.txt 

# Build the website:
make html
cd _build/pydata_sphinx_theme/

# Launch a local server:
python -m http.server 8000 --bind 127.0.0.1 &
```

In the browser:

# Open 

http://127.0.0.1:8000/index.html


______________________________________________________________________

## 6. Edit Website Content

Pages are written in Myst Markdown:

https://mystmd.org/

Examples:


```bash
About/about.md
People/faculty.md
People/students.md
```

Edit with your preferred editor:

```bash
nano People/faculty.md
```
_____________________________________________________________________

## 7 Test changes

In the terminal:

```bash
make html
```

In the browser:

Refresh:

http://127.0.0.1:8000/index.html

______________________________________________________________________

## 8. Commit Your Changes

In the terminal:


```bash
git status
git add .
git commit -m "Update website content"
```

______________________________________________________________________

## 9. Push Your Branch

In the terminal:

```bash
git push origin site-update
```

______________________________________________________________________

## 10. GitHub Actions & Deployment

This project uses GitHub Actions to build the website automatically.

- Pull Requests trigger test builds
- Merges into main trigger deployment

Monitor builds:

https://github.com/$GITHUB_USERNAME/www.ccb.jhu.edu/actions

After merging into main, the site is published automatically:
(might take a few minutes to build)

https://$GITHUB_USERNAME.github.io/www.ccb.jhu.edu/

______________________________________________________________________

## 10. Merge changes

If happy with the edits, open a Pull Request here:\
https://github.com/dpuiu/www.ccb.jhu.edu/pulls

Include a short description of your changes.

______________________________________________________________________

## 11. Review Process

All changes are reviewed by maintainers.

They may:

- Approve and merge
- Request changes
- Suggest improvements

______________________________________________________________________

## 12. Cleanup After Merge

Delete local & remote branch:

In the terminal:

```bash
git branch -d site-update
git push origin --delete site-update
```
