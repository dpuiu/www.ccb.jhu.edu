---
title: MyST Markdown Examples
author: Daniela Puiu
myst:
  html_meta:
    "keywords": "CCB, WSE, JHU"
    "description": "Center for Computational Biology"
    "robots": "index, follow"
---

```{contents}
:local:
:depth: 2
:hidden:
```

______________________________________________________________________

# Examples

## Substritution

{{CCB}}\
{{ccb}}

______________________________________________________________________

## Basic Markdown

bold **Bold**

italic *Italic*

`inline code`

- JHU
- WSE
- CCB

1. JHU
1. WSE
1. CCB

______________________________________________________________________

## Buttons

```{button-link} https://jhu.edu
:color: primary

JHU
```

______________________________________________________________________

(links)=

## Links

### External Page

[CCB](https://ccb.jhu.edu/){rel="nofollow"}

### Internal Page

{doc}`About </About/about>`

### Section

Jump to {ref}`links`.

### File Download

[Download WEBP](/_static/Logos/logo.webp)

______________________________________________________________________

## Footnotes

MyST supports footnotes.[^1]

\[^1\]: This is a footnote.

______________________________________________________________________

## Mathematics

Inline math:

$E = mc^2$

Display math:

$$ \\int\_{0}^{1} x^2 dx = \\frac{1}{3} $$

______________________________________________________________________

## Code Blocks

```python
def hello():
    print("Hello world")
```

```bash
ls -lh
git status
```

______________________________________________________________________

## Notes

:::{note} This is a note. :::

:::{warning} This action cannot be undone. :::

:::{tip} Use virtual environments. :::

:::{important} Read the documentation first. :::

:::{dropdown} Click to expand Hidden information appears here. :::

______________________________________________________________________

## Includes

```{include} /About/contact.md
```

______________________________________________________________________

## Image

```{image} /_static/logo.webp
:width: 300px
:align: center
:alt: Figure
```

______________________________________________________________________

## Definition Lists

Term 1 : Definition of term 1

Term 2 : Definition of term 2

______________________________________________________________________

## Task Lists

- [x] Install Sphinx
- [x] Install MyST
- [ ] Publish website

______________________________________________________________________

## Tables

| Name  | Role    |
| ----- | ------- |
| Alice | Faculty |
| Bob   | Student |
| Carol | Staff   |

______________________________________________________________________

## List table

:::{list-table} :header-rows: 0

- - CCB
- - WSE
- - JHU

:::

______________________________________________________________________

## CSV Table

```{csv-table}
:file: /People/collab.head.tsv
:header-rows: 1
:widths: 25 25 25 25
:delim: tab
```

## Grid_Equal

```{grid} 1 1 3 3

:::{grid-item-card}
{{ccb}}
:::

:::{grid-item-card}
{{wse}}
:::

:::{grid-item-card}
{{jhu}}
:::

```

______________________________________________________________________

## Grid_Diff

```{grid} 12

:::{grid-item-card}
:columns: 12 12 4 4
{{ccb}}
:::

:::{grid-item-card}
:columns: 12 12 8 8
{{wse}}
:::

```

______________________________________________________________________

## Tabset

```{tab-set}

:::{tab-item} CCB
{{CCB}}
:::

:::{tab-item} WSE
{{WSE}}
:::

:::{tab-item} JHU
{{JHU}}
:::

```

______________________________________________________________________

## Mermaid Diagrams

```{mermaid}
graph TD
    JHU[JHU] --> WSE[WSE] --> CCB[CCB]
```
