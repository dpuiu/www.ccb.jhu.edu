---
title: MyST Markdown Examples
author: Daniela Puiu
myst:
  html_meta:
    "keywords": "CCB, WSE, JHU"
    "description": "Center for Computational Biology"
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
:caption: Examples

About/index
People/index
Software/index
```

---

# Examples

## Substritution

{{CCB}}  
{{ccb}}

---

## Basic Markdown

**Bold**

*Italic*

`inline code`

- JHU
- WSE
- CCB

1. JHU
2. WSE
3. CCB

---

## Buttons

```{button-link} https://jhu.edu
:color: primary

JHU
```

---

(links)=
## Links

### External Page

[CCB](https://ccb.jhu.edu/){rel="nofollow"}  

### Internal Page

{doc}`About </About/about>`

### Section

Jump to {ref}`links`.

### File Download

[Download PDF](_static/logo.pdf)

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

```{include} /About/contact.md
```

---

## Image 

```{image} /_static/logo.png
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
* - CCB
* - WSE
* - JHU

:::

---

## CSV Table

```{csv-table}
:file: /People/collab.head.tsv
:header-rows: 1
:widths: 25 25 25 25
:delim: tab
```


## Grid_Equal

````{grid} 1 1 3 3

:::{grid-item-card}
{{ccb}}
:::

:::{grid-item-card}
{{wse}}
:::

:::{grid-item-card}
{{jhu}}
:::

````

---

## Grid_Diff

````{grid} 12

:::{grid-item-card}
:columns: 12 12 4 4
{{ccb}}
:::

:::{grid-item-card}
:columns: 12 12 8 8
{{wse}}
:::

````
---

## Tabset


````{tab-set}

:::{tab-item} CCB
{{CCB}}
:::

:::{tab-item} WSE
{{WSE}}
:::

:::{tab-item} JHU
{{JHU}}
:::

````

## Carousel

````{card-carousel} 3

:::{card} CCB
{{CCB}}
:::

:::{card} WSE
{{wse}}
:::

:::{card} JHU
{{jhu}}
:::

````

---
	
## Mermaid Diagrams

```{mermaid}
graph TD
    JHU[JHU] --> WSE[WSE] 
```
