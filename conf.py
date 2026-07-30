import os

#html_theme = os.environ.get("html_theme", "furo")
html_theme = os.environ.get("html_theme")

author = "Daniela Puiu"
copyright = "The Center for Computational Biology at Johns Hopkins University"
project = "CCB"
release = "2026"

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'OLD' , 'other', 'Software.wiki' , 'Examples', '.venv', "README*md"]
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

master_doc = "index"

myst_enable_extensions = [
    "colon_fence",
    "dollarmath",
    "amsmath",
    "substitution",
    "attrs_inline",
    "html_admonition",
    "html_image"
]
myst_substitutions = {
    "ARCH": "[ARCH](https://www.arch.jhu.edu/)",
    "bio":  "[Department of Bilogy](https://bio.jhu.edu/)",
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
html_extra_path = ['_static/.nojekyll', '_static/google5ed79d6dabf65a2d.html', '_static/robots.txt']
html_js_files = ["custom.js"]
#html_logo = "_static/logo.png"  # keep the comments
html_search_language = "en"
html_search = True
html_static_path = ["_static"]

html_theme_options = {
        'header_links_before_dropdown': 10,
        'announcement': "Welcome 2026 Summer Interns!!!",
        "show_prev_next": False,
        "sticky_banners": True,
        "article_footer_items": ["last-updated", "edit-this-page"],
        "navbar_end": ["theme-switcher", "navbar-icon-links",],
        "icon_links": [{"name": "GitHub", "url": "https://github.com/dpuiu/www.ccb.jhu.edu","icon": "fa-brands fa-github",},],
#        "external_links": [{ "name": "JHU","url": "https://jhu.edu",}],
}

html_title = "Center for Computational Biology"
html_use_index = True
html_favicon = "_static/favicon.ico"
html_permalinks = True

redirects = {
#    "chess/index": "/Data/data.html#chess",  
#    "eastr/index": "/Software/transcriptome_assembly.html#EASTR",
#    "software/tophat/index": "/Software/alignment.html#tophat",

    "software/diamund/index" : "/Software/alignment.html#diamund",
    "software/hisat2/index" : "/Software/alignment.html#hisat2",
    "hisat-genotype/index" : "/Software/alignment.html#hisat-genotype", #!!!
    "software/hisat/index" : "/Software/alignment.html#hisat",
    "software/tophat/index" : "/Software/alignment.html#tophat",

    "software/bracken/index" : "/Software/metagenomics.html#bracken",
    "software/centrifuge/index" : "/Software/metagenomics.html#centrifuge",
    "software/kraken2/index" : "/Software/metagenomics.html#kraken2",
    "software/kraken/index" : "/Software/metagenomics.html#kraken",
    "software/krakentools/index" : "/Software/metagenomics.html#krakentools",
    "software/krakenuniq/index" : "/Software/metagenomics.html#krakenuniq",
    "software/pavian/index" : "/Software/metagenomics.html#pavian",

    "software/genesplicer/index" : "/Software/gene_finding.html#genesplicer",
    "software/glimmerhmm/index" : "/Software/gene_finding.html#glimmerhmm",
    "software/glimmer/index" : "/Software/gene_finding.html#glimmer",
    "software/jigsaw/index" : "/Software/gene_finding.html#jigsaw",
    "lifton/index" : "/Software/gene_finding.html#lifton",

    "software/autoeditor/index" : "/Software/genome_assembly.html#autoeditor",  #!!!
    "software/FLASH/index" : "/Software/genome_assembly.html#flash",
    "gage_b/index" : "/Software/genome_assembly.html#gage-b",
    "software/quake/index" : "/Software/genome_assembly.html#quake",

    "eastr/index" : "/Software/transcriptome_assembly.html#eastr",
    "software/EDGE-pro/index" : "/Software/transcriptome_assembly.html#edge-pro",
    "software/stringtie/index" : "/Software/transcriptome_assembly.html#stringtie",
    "software/tiebrush/index" : "/Software/transcriptome_assembly.html#tiebrush",

    "software/BRCA-diagnostic/index" : "/Software/other_tools.html#brca-gene-testing",
    "software/dive/index" : "/Software/other_tools.html#dive",
    "software/ELPH/index" : "/Software/other_tools.html#elph",
    "software/fqtrim/index" : "/Software/other_tools.html#fqtrim",
    "OpenSpliceAI/index" : "/Software/other_tools.html#openspliceai",
    "software/phymmbl/index" : "/Software/other_tools.html#phymmbl",
    "splam/index" : "/Software/other_tools.html#splam",

    "chess/index": "/Data/data.html#chess",   # !!!
    "HIV_Atlas/index": "/Data/data.html#hiv_atlas",
    "T2T.shtml": "/Data/data.html#T2T",		# !!!

    "data/eupathDB/index": "/Data/data.html#eupathDB",  
}
