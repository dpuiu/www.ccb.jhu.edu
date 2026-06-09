# Contributing to the CCB Website

This repository contains the source files for the Center for Computational Biology (CCB) website draft (Sphinx Furo[default] or PyData Themes):  
  https://dpuiu.github.io/www.ccb.jhu.edu/  
  https://dpuiu.github.io/www.ccb.jhu.edu/pydata/  
 
Official CCB website:  
  https://ccb.jhu.edu/

We welcome contributions from collaborators and lab members. You can improve the website by editing Markdown (`.md`) files and submitting a Pull Request.   
All changes are reviewed before being merged and published.

---

# Workflow Overview

1. Fork the repository  
2. Clone your fork locally  
3. Create a new branch  
4. Make your changes  
5. Commit and push your branch  
6. Open a Pull Request  
7. A CCB maintainer reviews and merges your changes  
8. The website is automatically rebuilt and deployed  

---

# 1. Fork the Repository

Create your own fork of:  
  https://github.com/dpuiu/www.ccb.jhu.edu

---

# 2. Clone Your Fork

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/www.ccb.jhu.edu.git
cd www.ccb.jhu.edu
```

---

# 3. Create a Branch

Always work on a separate branch (do not commit directly to main):

```bash
git checkout -b update-my-page
```

---

# 4. Repository Structure

The repository is organized by website section. Most content is written in Markdown (`.md`) using MyST.

```
www.ccb.jhu.edu/
├── index.md          # Website home page
├── conf.py           # Sphinx configuration
├── _static/          # Images, logos, PDFs, and other static files
└── README.md         # This file
 
├── About/            # About CCB, Publications, Contact
├── People/           # Faculty, staff, postdocs, students, alumni
├── Software/         # Software developed by CCB
├── Data/             # Databases developed by CCB	
├── Education/        # The Ph.D. program, courses
├── CBCC/             # Consulting Core  
 
├── Examples/         # Markdown/MyST tested examples (tables,grids,images,layouts...)
```

---

# 5. Edit Website Content

Pages are written in Markdown using MyST:  
https://mystmd.org/

Example files:

```
About/about.md
People/Faculty/faculty.md
People/students.md
```

Tested elements:  
[MD](https://dpuiu.github.io/www.ccb.jhu.edu/_sources/Examples/index.md.txt) =>   
  [HTML](https://dpuiu.github.io/www.ccb.jhu.edu/Examples/)        # Furo theme  
  [HTML](https://dpuiu.github.io/www.ccb.jhu.edu/pydata/Examples/) # PyData theme


---

# 6. Commit Your Changes

```bash
git add .
git commit -m "Update website content"
```

---

# 7. Push Your Branch

```bash
git push origin update-my-page
```

---

# 8. GitHub Actions (Automatic Deployment)

This project uses GitHub Actions to build the website automatically.

- Pull Requests trigger test builds
- Merges into main trigger deployment

Monitor builds:
https://github.com/YOUR_GITHUB_USERNAME/www.ccb.jhu.edu/actions

---

# 9. Website Deployment

After merging into main, the site is published automatically:

https://YOUR_GITHUB_USERNAME.github.io/www.ccb.jhu.edu/  
https://YOUR_GITHUB_USERNAME.github.io/www.ccb.jhu.edu/pydata/


---

# 10. Open a Pull Request

If happy with the edits, open a PR here:

https://github.com/dpuiu/www.ccb.jhu.edu

Include a short description of your changes.

---

# 11. Review Process

All changes are reviewed by maintainers.

They may:
- Approve and merge
- Request changes
- Suggest improvements

---

# 12. Cleanup (Recommended)

After merge:

```bash
git branch -d update-my-page
git push origin --delete update-my-page
```

