SPHINXBUILD = sphinx-build
SOURCEDIR = .
BUILDDIR = _build

html_theme ?= pydata_sphinx_theme

.PHONY: html clean

html:
	html_theme=$(html_theme) $(SPHINXBUILD) $(SOURCEDIR) $(BUILDDIR)/$(html_theme)

clean:
	rm -rf $(BUILDDIR)/*
