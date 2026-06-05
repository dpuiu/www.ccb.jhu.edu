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
extensions = [ 
    "myst_parser",
    "sphinx_design",
    "sphinx.ext.githubpages",
    "sphinx_sitemap",
    "sphinx_copybutton",
    "sphinxcontrib.mermaid",
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",
    "sphinx.ext.viewcode",
    "sphinx.ext.mathjax",
]


master_doc = "index"
myst_enable_extensions = [
    "colon_fence",
    "dollarmath",
    "amsmath",
    "substitution",
    "attrs_inline"
]
myst_substitutions = {
    "CCB": "[Center for Computational Biology](https://ccb.jhu.edu/)",
    "BME": "[Department of Biomedical Engineering](https://www.bme.jhu.edu/)",
    "WSE": "[Whiting School of Engineering](https://engineering.jhu.edu/)"
}


templates_path = ['_templates']

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output
html_baseurl = "https://dpuiu.github.io/www.ccb.jhu.edu/"
html_css_files = [ "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap", "custom.css", ]
html_extra_path = ['_static/.nojekyll']
html_js_files = ["custom.js"]
html_logo = "_static/logo.png"
html_search_language = "en"
html_search = True
html_static_path = ["_static"]
html_theme = "furo"
html_theme_options = {
	'announcement': '''
		<div style="display:flex;justify-content:space-between;align-items:center;background:#1D4475;color:white;">
			 <div style="display:flex;gap:15px;">
				<a href="https://ccb.jhu.edu/" alt="CCB"><img src="/www.ccb.jhu.edu/_static/ccblogotext_wbg_50.png" alt="CCB"></a>
			</div>

			<div>
                                <a href="http://www.hopkinsmedicine.org/som/" alt="JHMI"><img src="/www.ccb.jhu.edu/_static/jhmilogo_wbg_50.png" alt="JHMI" class="hide-mobile"></a>
                                <a href="https://ccb.jhu.edu/img/jhsphlogo_wbg.png" alt="JHSPH"><img src="/www.ccb.jhu.edu/_static/jhsphlogo_wbg_50.png" alt="JHSPH" class="hide-mobile"></a>
				<a href="https://engineering.jhu.edu/" alt="WSE"><img src="/www.ccb.jhu.edu/_static/jhu-wse-logo-white_50.png"  alt="WSE"></a>
			</div>
		</div>
	'''
}
html_title = "Center for Computational Biology"
html_use_index = True

