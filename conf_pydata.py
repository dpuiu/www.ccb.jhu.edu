author = 'Daniela Puiu'
copyright = 'The Center for Computational Biology at Johns Hopkins University'
project = 'CCB'
release = '2026'

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'OLD']
master_doc = "index"

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
    "sphinx_reredirects",
    "sphinx.ext.mathjax"
]

redirects = {
    "index" : "About/about.html",
    "About/index": "about.html",
    "People/index": "Faculty/faculty.html",
    "People/Faculty/index": "faculty.html",
    "Software/index": "software_alignment.html",
    "Data/index": "data.html",
    "Education/index" : "information.html",
}

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

html_baseurl = "https://dpuiu.github.io/ccb.jhu.edu/"
html_css_files = [ "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap", "custom.css", ]
html_extra_path = ['_static/.nojekyll']
html_js_files = ["custom.js"]
html_logo = "_static/Logos/logo.png"
html_search_language = "en"
html_search = True
html_static_path = ["_static"]
html_theme = "pydata_sphinx_theme"
html_theme_options = {
	'announcement': "Welcome 2026 Summer Interns!!!"
}
html_title = "Center for Computational Biology"
html_use_index = True
