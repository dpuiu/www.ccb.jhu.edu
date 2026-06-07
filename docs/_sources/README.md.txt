# Contributing to the CCB Website

This repository contains the source files for the **Center for Computational Biology (CCB)** website:

https://www.ccb.jhu.edu

Contributions are welcome. If you would like to update content on the website, you can edit the Markdown (`.md`) files in this repository and submit your changes for review. Once approved, a CCB maintainer will merge your changes and publish them to the website.

## Workflow Overview

1. Fork the repository.
2. Clone your fork.
3. Edit the appropriate Markdown files.
4. Commit and push your changes.
5. Submit a Pull Request.
6. A CCB maintainer will review and merge approved changes.

## 1. Fork the Repository

Create your own fork of:

```text
https://github.com/dpuiu/www.ccb.jhu.edu
```

## 2. Clone Your Fork

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/www.ccb.jhu.edu.git
cd www.ccb.jhu.edu
```

## 3. Create a Branch

```bash
git checkout -b update-my-page
```

## 4. Repository Structure

The repository is organized by website section. Most content is stored in Markdown (`.md`) files.

```text
www.ccb.jhu.edu/
├── About/            # About CCB, Publications, Contact
├── People/           # Faculty, staff, postdocs, students, alumni
├── Software/         # Software developed by CCB
├── Data/             # Databases developed by CCB	
├── Education/        # The Ph.D. program, courses
├── Consulting Core/  # Consulting   
├── Examples/         # Markdown examples
├── _static/          # Images, logos, PDFs, and other static files
├── conf.py           # Sphinx configuration
├── index.md          # Website home page
└── README.md         # This file
```

## 5. Edit Website Content

Most website pages are written in Markdown (`.md`) files.

Examples:

```text
About/about.md
People/faculty.md
People/students.md
Software/index.md
Research/index.md
```

Make the desired updates using your favorite text editor.

## 6. Commit Your Changes

```bash
git add .
git commit -m "Update website content"
```

## 7. Push Your Branch

```bash
git push origin update-my-page
```

## 8. Submit a Pull Request

Open a Pull Request from your branch to the main repository:

```text
https://github.com/dpuiu/www.ccb.jhu.edu
```

Please include a brief description of your changes.

## 9. Review and Merge

All changes are reviewed before publication.

A CCB maintainer may:

* Approve and merge your changes.
* Request revisions.
* Discuss suggested improvements.

Once merged, your updates will become part of the CCB website and will be published during the next website deployment.

