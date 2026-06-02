# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'CCB'
copyright = 'The Center for Computational Biology at Johns Hopkins University'
author = 'Daniela Puiu'
release = '2026'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [ "myst_parser","sphinx_design","sphinx.ext.githubpages"]
myst_enable_extensions = ["colon_fence"]
templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'OLD']


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output
html_baseurl = "https://dpuiu.github.io/www.ccb.jhu.edu/"
html_title = 'Center for Computational Biology'
html_theme = 'furo' # alabaster'
html_static_path = ['_static']
html_js_files = ["custom.js"]
html_css_files = [ "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap", "custom.css", ]
#html_css_files = [ "custom.css", ]
html_theme_options = { 
	'announcement': '''
		<div style="display:flex;justify-content:space-between;align-items:center;background:#1D4475;color:white;">
			 <div style="display:flex;gap:15px;">
				<img src="/www.ccb.jhu.edu/_static/ccblogotext_wbg_50.png" alt="CCB">
                                <img src="/www.ccb.jhu.edu/_static/jhmilogo_wbg_50.png" alt="JHMI" class="hide-mobile">
			</div>

			<div>
				<a href="https://engineering.jhu.edu/" alt="JHU WSE"><img src="/www.ccb.jhu.edu/_static/jhu-wse-logo-white_50.png"  alt="WSE"></a>
				<img src="/www.ccb.jhu.edu/_static/jhsphlogo_wbg_50.png" alt="JHSPH" class="hide-mobile">
			</div>
		</div>
	'''
}
html_extra_path = ['_static/.nojekyll']

html_use_index = True
html_search_language = "en"
html_search = True
