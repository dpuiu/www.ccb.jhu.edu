import os

THEME = os.environ.get("SPHINX_THEME", "furo")


#if THEME == "pydata":
#    html_theme = "pydata_sphinx_theme"
#    html_theme_options = {
#        "navbar_background": "white",
#    }
#else:
#    html_theme = "furo"
#    html_theme_options = {
#        "light_css_variables": {
#            "color-brand-primary": "#005b96",
#        }
#    }

##################################


author = 'Daniela Puiu'
copyright = 'The Center for Computational Biology at Johns Hopkins University'
project = 'CCB'
release = '2026'

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
    "index" : "About/about.html",
    "About/index": "about.html",
    "People/index": "faculty.html",
    "Software/index": "software_alignment.html",
    "Data/index": "data.html",
    "Education/index" : "information.html",
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

html_baseurl = "https://dpuiu.github.io/www.ccb.jhu.edu/"
html_css_files = [ "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap", "custom.css", ]
html_extra_path = ['_static/.nojekyll']
html_js_files = ["custom.js"]
#html_logo = "_static/Logos/logo.png"
html_search_language = "en"
html_search = True
html_static_path = ["_static"]

if THEME != "pydata":
    html_theme = "pydata_sphinx_theme"
else:
    html_theme = "furo"

html_theme_options = {
        'header_links_before_dropdown': 10,
        'announcement': '''
                <div style="display:flex;justify-content:space-between;align-items:center;background:#1D4475;color:white;padding:0px;">
                         <div style="display:flex;gap:15px;">
                                <a href="index.html" alt="CCB"><img src={{ pathto("_static/Logos/ccblogo_breathable_50.png", 1) }}" alt="CCB"></a>
                        </div>

                        <div>
                                <a href="http://www.hopkinsmedicine.org/som/" alt="SOM"><img src="_static/Logos/jhmilogo_wbg_50.png" alt="SOM" class="hide-mobile"></a>
                                <a href="https://publichealth.jhu.edu/" alt="SPH"><img src="_static/Logos/jhsphlogo_wbg_50.png" alt="SPH" class="hide-mobile"></a>
                                <a href="https://engineering.jhu.edu/" alt="WSE"><img src="_static/Logos/jhu-wse-logo-white_50.png"  alt="WSE"></a>
                        </div>
                </div>
        '''    
}


html_title = "Center for Computational Biology"
html_use_index = True

#        'announcement': "Welcome 2026 Summer Interns!!!"


