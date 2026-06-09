SPHINXBUILD = sphinx-build
SOURCEDIR = .
BUILDDIR = _build

theme ?= furo

.PHONY: html clean

html:
	SPHINX_THEME=$(theme) $(SPHINXBUILD) $(SOURCEDIR) $(BUILDDIR)/$(theme)

clean:
	rm -rf $(BUILDDIR)/*
