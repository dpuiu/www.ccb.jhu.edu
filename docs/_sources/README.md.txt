# Contributing to the CCB Website

This repository contains the source files for the Center for Computational
Biology (CCB) website draft (Sphinx PyData Theme):\
https://dpuiu.github.io/www.ccb.jhu.edu/

Official CCB website:\
https://ccb.jhu.edu/

We welcome contributions from collaborators and lab members. You can improve the
website by editing Markdown (`.md`) files and submitting a Pull Request.\
All changes are reviewed before being merged and published.

______________________________________________________________________

## Workflow Overview

1. Fork the repository
1. Clone your fork locally
1. Create a new branch
1. Make your changes
1. Commit and push your branch
1. Open a Pull Request
1. A CCB maintainer reviews and merges your changes
1. The website is automatically rebuilt and deployed

______________________________________________________________________

## 1. Fork the Repository

Create your own fork of:\
https://github.com/dpuiu/www.ccb.jhu.edu

______________________________________________________________________

## 2. Clone Your Fork

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/www.ccb.jhu.edu.git
cd www.ccb.jhu.edu
```

______________________________________________________________________

## 3. Create a Branch

Always work on a separate branch (do not commit directly to main):

```bash
git checkout -b update-my-page
```

______________________________________________________________________

## 4. Repository Structure

The repository is organized by website section. Most content is written in
Markdown (`.md`) using MyST.

```text
www.ccb.jhu.edu/
├── index.md          # Website home page
├── conf.py           # Sphinx configuration
├── _static/          # Images, logos, PDFs, and other static files
└── README.md         # This file
 
├── About/            # About CCB, Publications, Contact
├── People/           # Faculty, staff, postdocs, students, alumni
├── People/alekseyz/  # Individual profiles
...
├── Software/         # Software developed by CCB
├── Data/             # Databases developed by CCB
├── Education/        # The Ph.D. program, courses
├── CBCC/             # Consulting Core  
 
├── Examples/         # Markdown/MyST tested examples (tables,grids,images,layouts...)
```

______________________________________________________________________

## 5. Edit Website Content

Pages are written in Markdown using MyST:\
https://mystmd.org/

Example files:

```text
About/about.md
People/faculty.md
People/students.md
```

Tested elements:
[MD](https://dpuiu.github.io/www.ccb.jhu.edu/_sources/Examples/index.md.txt) =>
[HTML](https://dpuiu.github.io/www.ccb.jhu.edu/Examples/)

______________________________________________________________________

## 6. Commit Your Changes

```bash
git add .
git commit -m "Update website content"
```

______________________________________________________________________

## 7. Push Your Branch

```bash
git push origin update-my-page
```

______________________________________________________________________

## 8. GitHub Actions (Automatic Deployment)

This project uses GitHub Actions to build the website automatically.

- Pull Requests trigger test builds
- Merges into main trigger deployment

Monitor builds:\
https://github.com/YOUR_GITHUB_USERNAME/www.ccb.jhu.edu/actions

______________________________________________________________________

## 9. Website Deployment

After merging into main, the site is published automatically:

https://YOUR_GITHUB_USERNAME.github.io/www.ccb.jhu.edu/

______________________________________________________________________

## 10. Open a Pull Request

If happy with the edits, open a PR here:\
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

## 12. Cleanup (Recommended)

After merge:

```bash
git branch -d update-my-page
git push origin --delete update-my-page
```
