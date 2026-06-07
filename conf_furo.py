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
    "sphinx_reredirects",
    "sphinx.ext.githubpages",
    "sphinx_sitemap",
    "sphinx_copybutton",
    "sphinxcontrib.mermaid",
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",
    "sphinx.ext.viewcode",
    "sphinx.ext.mathjax",
]

redirects = {
    "About/index": "about.html",
    "People/index": "faculty.html",
    "Software/index": "software_alignment.html",
    "Data/index": "data.html",
    "Education/index" : "information.html"
}

master_doc = "index"

myst_enable_extensions = [
    "colon_fence",
    "dollarmath",
    "amsmath",
    "substitution",
    "attrs_inline"
]
myst_substitutions = {
    "ARCH": "[ARCH](https://www.arch.jhu.edu/)",
    "bme":  "[Department of Biomedical Engineering](https://www.bme.jhu.edu/)",
    "BME":  "[BME](https://www.bme.jhu.edu/)",
    "bsph" : "[Department of Biostatistics](https://publichealth.jhu.edu/departments/biostatistics)",
    "BSPH" : "[BSPH](https://publichealth.jhu.edu/departments/biostatistics)",
    "ccb":  "[Center for Computational Biology](https://ccb.jhu.edu/)",
    "CCB":  "[CCB](https://ccb.jhu.edu/)",
    "cs":   "[Department of Computer Science](https://www.cs.jhu.edu/)",
    "CS":   "[CS](https://www.cs.jhu.edu/)",
    "dsai": "[Data Science & AI Institute](https://ai.jhu.edu/)",
    "DSAI": "[DSAI](https://ai.jhu.edu/)",
    "igs":  "[Department of Genetic Medicine](https://www.hopkinsmedicine.org/genetic-medicine/)",
    "IGS":  "[Department of Genetic Medicine](https://www.hopkinsmedicine.org/genetic-medicine/)",
    "jhu":  "[Johns Hopkins University](http://www.jhu.edu/)",
    "JHU":  "[JHU](http://www.jhu.edu/)",
    "ksas": "[Krieger School of Arts and Sciences](https://krieger.jhu.edu/)",
    "KSAS": "[KSAS](https://krieger.jhu.edu/)",
    "som":  "[School of Medicine](https://www.hopkinsmedicine.org/som)",
    "SOM":  "[SOM](https://www.hopkinsmedicine.org/som)",
    "sph":  "[Bloomberg School of Public Health](https://publichealth.jhu.edu/)",
    "SPH":  "[SPH](https://publichealth.jhu.edu/)",
    "wse":  "[Whiting School of Engineering](https://engineering.jhu.edu/)",
    "WSE":  "[WSE](https://engineering.jhu.edu/)"
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
				<a href="https://ccb.jhu.edu/" alt="CCB"><img src="/_static/ccblogotext_wbg_50.png" alt="CCB"></a>
			</div>

			<div>
                                <a href="http://www.hopkinsmedicine.org/som/" alt="JHMI"><img src="/_static/jhmilogo_wbg_50.png" alt="JHMI" class="hide-mobile"></a>
                                <a href="https://ccb.jhu.edu/img/jhsphlogo_wbg.png" alt="JHSPH"><img src="/_static/jhsphlogo_wbg_50.png" alt="JHSPH" class="hide-mobile"></a>
				<a href="https://engineering.jhu.edu/" alt="WSE"><img src="/_static/jhu-wse-logo-white_50.png"  alt="WSE"></a>
			</div>
		</div>
	'''
}
html_title = "Center for Computational Biology"
html_use_index = True

