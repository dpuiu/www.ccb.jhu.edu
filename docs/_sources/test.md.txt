---
title: MyST Markdown Showcase
author: Daniela Puiu
myst:
  html_meta:
    "keywords": "bioinformatics1"
    "description": "bioinformatics2"
    "robots": "index, follow"
---

<!--```{contents}
:local:
:depth: 2
```
--- -->

```{toctree}
:maxdepth: 2
:hidden:

About/index
People/index
Software/index
```

---

# Welcome Page

Welcome to {{CCB}}

---

## Basic Markdown

**Bold**

*Italic*

`inline code`

- Item 1
- Item 2
- Item 3

1. First
2. Second
3. Third

---

## Buttons

```{button-link} https://github.com
:color: primary

GitHub
```

---

(links)=
## Links

### External

Visit the [JHU CCB](https://ccb.jhu.edu/){rel="nofollow"} website.

### Download
.  
.  
.  
.  
.  
.  
.  
.  
.  
.  
.  

[Download PDF](_static/sample.pdf)

### Reference
Jump to {ref}`links`.

---

## Footnotes

MyST supports footnotes.[^1]
	
[^1]: This is a footnote.

---

## Mathematics

Inline math:

$E = mc^2$

Display math:

$$
\int_{0}^{1} x^2 dx = \frac{1}{3}
$$

---

## Code Blocks

```python
def hello():
    print("Hello world")
```

```bash
ls -lh
git status
```

---

## Notes

:::{note}
This is a note.
:::

:::{warning}
This action cannot be undone.
:::

:::{tip}
Use virtual environments.
:::

:::{important}
Read the documentation first.
:::

:::{dropdown} Click to expand
Hidden information appears here.
:::

---

## Includes

```{include} About/contact.md
```

---

## Image 

```{image} _static/logo.png
:width: 300px
:align: center
:alt: Figure
```

---

## Definition Lists

Term 1
: Definition of term 1

Term 2
: Definition of term 2

---

## Task Lists

- [x] Install Sphinx
- [x] Install MyST
- [ ] Publish website

---

## Tables

| Name | Role |
|------|------|
| Alice | Faculty |
| Bob | Student |
| Carol | Staff |

---

## List table

:::{list-table}
:header-rows: 1
* - Name
* - Alice
* - Bob
* - Carol

:::

---

## CSV Table

```{csv-table}
:file: People/collab.head.tsv
:header-rows: 1
:widths: 25 25 25 25
:delim: tab
```


## Grid_Equal

````{grid} 1 1 3 3

:::{grid-item-card}
Install using apt on Ubuntu/Debian systems.
:::

:::{grid-item-card}
Install using pip in PowerShell.
:::

:::{grid-item-card}
Install using pip in CMD.
:::

````

---

## Grid_Diff

````{grid} 12

:::{grid-item-card}
:columns: 12 12 4 4

This card takes 1 thrird.
:::

:::{grid-item-card}
:columns: 12 12 8 8

This card takes two thirds.
:::

````
---

## Tabset


````{tab-set}

:::{tab-item} Linux
Linux content here
:::

:::{tab-item} Mac
Mac content here
:::

:::{tab-item} Windows
Windows content here
:::

````

## Carousel

````{card-carousel} 3

```{card} Linux
Linux instructions
```

```{card} Mac
Mac instructions
```

```{card} Windows
Windows instructions
```

````

---
	
## Mermaid Diagrams

```{mermaid}
graph TD
    A[Start] --> B[Build]
    B --> C[Deploy]
```
