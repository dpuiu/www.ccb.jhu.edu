# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

author = 'Daniela Puiu'
copyright = 'The Center for Computational Biology at Johns Hopkins University'
project = 'CCB'
release = '2026'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'OLD']
extensions = [ "myst_parser","sphinx_design","sphinx.ext.githubpages","sphinx_sitemap"]
master_doc = "index"

myst_enable_extensions = [
    "colon_fence",
    "dollarmath",
    "amsmath",
    "substitution",
    "attrs_inline"
]
myst_substitutions = {
    "CCB": "[**Center for Computational Biology**](https://ccb.jhu.edu/)",
}


templates_path = ['_templates']

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output
html_baseurl = "https://dpuiu.github.io/ccb.jhu.edu/"
##html_baseurl = "https://dpuiu.github.io/www.ccb.jhu.edu/"
html_css_files = [ "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap", "custom.css", ]
html_extra_path = ['_static/.nojekyll']
html_js_files = ["custom.js"]
html_logo = "_static/logo.png"
html_search_language = "en"
html_search = True
html_static_path = ["_static"]
html_theme = "pydata_sphinx_theme"
html_theme_options = {
	'announcement': "Welcome 2026 Summer Interns!!!"
}
html_title = "Center for Computational Biology"
html_use_index = True
