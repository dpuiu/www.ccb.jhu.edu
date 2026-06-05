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

```{include} include.md
```

---

## Images

![CCB Logo](_static/logo.png)

```{image} _static/logo.png
:width: 300px
:align: center
:alt: Figure
```


---

## Tables

| Name | Role |
|------|------|
| Alice | Faculty |
| Bob | Student |
| Carol | Staff |

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

## List table

:::{list-table}
:header-rows: 1
* - Name
* - Alice
* - Bob
* - Carol

:::

---

## Grid

`````{grid} 1 1 3 3

::::{grid-item-card}
Install using apt on Ubuntu/Debian systems.
::::

::::{grid-item-card}
:::{list-table}
:header-rows: 0
* - Alice
* - Bob
* - Carol
:::
::::

::::{grid-item-card}
Install using pip in PowerShell or CMD.
::::

`````

---

## Grid_4_4_4

````{grid} 12

:::{grid-item-card}
:columns: 4

This card takes 1 thrird.
:::


:::{grid-item-card}
:columns: 4

This card takes 1 thrird.
:::

:::{grid-item-card}
:columns: 4

This card takes 1 thrird.
:::

````

---

## Grid_8_4

````{grid} 12

:::{grid-item-card}
:columns: 8

This card takes 1 thrird.
:::

:::{grid-item-card}
:columns: 4

This card takes two thirds.
:::

````

---

## Grid_4_4_4_adjust


````{grid} 12

:::{grid-item-card}
:columns: 12 6 4 4

Install using apt on Ubuntu/Debian systems.
:::

:::{grid-item-card}
:columns: 12 6 4 4

Alice / Bob / Carol table
:::

:::{grid-item-card}
:columns: 12 6 4 4

Install using pip in PowerShell or CMD.
:::

````

---

## Grid_4_8_adjust

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

## Grid_8_2_2

````{grid} 12

:::{grid-item-card}
:columns: 8

This card takes half the row.
:::

:::{grid-item-card}
:columns: 2

This card takes one quarter.
:::

:::{grid-item-card}
:columns: 2

This card takes one quarter.
:::

````

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


::::{tab-set}

:::{tab-item} Linux
Linux content here
:::

:::{tab-item} Mac
Mac content here
:::

:::{tab-item} Windows
Windows content here
:::

::::

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

## CSV

```{csv-table}
:file: people.csv
:header-rows: 1
:widths: 10 40 20 30
```

---

## Mermaid


Better than plain images when you want numbering and captions.

---

## Mermaid Diagrams

```{mermaid}
graph TD
    A[Start] --> B[Build]
    B --> C[Deploy]
```
