# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'CCB'
copyright = '2026, Daniela Puiu'
author = 'Daniela Puiu'
release = '2026'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [ "myst_parser","sphinx_design"]
myst_enable_extensions = ["colon_fence"]
templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'OLD']


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_title = 'Center for Computational Biology'
html_theme = 'furo' # alabaster'
html_static_path = ['_static']
html_js_files = ["custom.js"]
html_css_files = [ 'custom.css', ]
html_theme_options = { 'announcement': '<div style="display:flex;justify-content:space-between;align-items:center;background:#1D4475;color:white;"><img src="/_static/ccblogotext_wbg_50.png"><img src="/_static/jhu-wse-logo-white_50.png"></div>'}

html_use_index = True
html_search_language = "en"
html_search = True
