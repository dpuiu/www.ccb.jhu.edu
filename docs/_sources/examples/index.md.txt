---
title: MyST Markdown Examples
author: Daniela Puiu
myst:
  html_meta:
    "keywords": "CCB, WSE, JHU"
    "description": "Center for Computational Biology"
    "robots": "index, follow"
orphan: true
---

```{contents}
:local:
:depth: 2
```

# Examples

## Substritution

{{CCB}}\
{{ccb}}

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

## Buttons

```{button-link} https://jhu.edu
:color: primary

JHU
```

(links)=
## Links

### External Page

[CCB](https://ccb.jhu.edu/){rel="nofollow"}

### Internal Page

{doc}`About </about/about>`

### Section

Jump to {ref}`links`.

### File Download

[Download WEBP](/_static/logos/logo.webp)

## Footnotes

MyST supports footnotes.[^1]

[^1]: This is a footnote.

## Mathematics

Inline math:

$E = mc^2$

Display math:

$$ \\int\_{0}^{1} x^2 dx = \\frac{1}{3} $$

## Code Blocks

```python
def hello():
    print("Hello world")
```

```bash
ls -lh
git status
```

## Notes

```{note}
:class: dropdown

This is the first line of text.
This is the rest of the body text.
```

## Includes

```{include} /about/contact.md
```

## Image

```{image} /_static/logos/logo.webp
:width: 300px
:align: center
:alt: Figure
```

## Definition Lists

Term 1 : Definition of term 1

Term 2 : Definition of term 2

## Task Lists

- [x] Install Sphinx
- [x] Install MyST
- [ ] Publish website

## Tables

| Name  | Role    |
| ----- | ------- |
| Alice | Faculty |
| Bob   | Student |
| Carol | Staff   |

## List table

:::{list-table} :header-rows: 0

- - CCB
- - WSE
- - JHU

:::

## CSV Table

```{csv-table}
:file: /people/collab.head.tsv
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

## Mermaid Diagrams

```{mermaid}
graph TD
    JHU[JHU] --> WSE[WSE] --> CCB[CCB]
```

## Bootstrap carousel

```{raw} html

<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">

  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2"></button>
  </div>

  <div class="carousel-inner">
    <div class="carousel-item active"><img src="/_static/people/alaina-shumate.webp" class="d-block w-100 img-fluid" alt="Image 1"></div>
    <div class="carousel-item"><img src="/_static/people/aleksey-zimin.webp" class="d-block w-100 img-fluid" alt="Image 2"></div>
    <div class="carousel-item"><img src="/_static/people/alexis-battle.webp" class="d-block w-100 img-fluid" alt="Image 3"></div>
  </div>

  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span></button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next"><span class="carousel-control-next-icon"></span></button>

</div>
```
