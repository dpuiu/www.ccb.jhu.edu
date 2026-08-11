import os

#html_theme = os.environ.get("html_theme", "furo")
html_theme = os.environ.get("html_theme")

author = "Daniela Puiu"
copyright = "The Center for Computational Biology at Johns Hopkins University"
project = "CCB"
release = "2026"

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'OLD' , '.venv', "README*md"]
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
    "bsph": "[Department of Biostatistics](https://publichealth.jhu.edu/departments/biostatistics)",
    "BSPH": "[BSPH](https://publichealth.jhu.edu/departments/biostatistics)",
    "cardiology": "[Department of Medicine, Division of Cardiology](https://www.hopkinsmedicine.org/heart-vascular-institute/cardiology)",
    "ccb":  "[Center for Computational Biology](https://ccb.jhu.edu/)",
    "CCB":  "[CCB](https://ccb.jhu.edu/)",
    "chembe": "[Department of Chemical & Biomolecular Engineering](https://engineering.jhu.edu/chembe/)",
    "cs":   "[Department of Computer Science](https://www.cs.jhu.edu/)",
    "CS":   "[CS](https://www.cs.jhu.edu/)",
    "dhpm": "[Department of Health Policy and Management](https://publichealth.jhu.edu/departments/health-policy-and-management)",
    "dsai": "[data Science & AI Institute](https://ai.jhu.edu/)",
    "DSAI": "[DSAI](https://ai.jhu.edu/)",
    "dgm":  "[Department of Genetic Medicine](https://www.hopkinsmedicine.org/genetic-medicine/)",
    "DGM":  "[DGM](https://www.hopkinsmedicine.org/genetic-medicine/)",
    "icm":  "[Institute for Computational Medicine](https://icm.jhu.edu/)",
    "jhu":  "[Johns Hopkins University](http://www.jhu.edu/)",
    "JHU":  "[JHU](http://www.jhu.edu/)",
    "ksas": "[Krieger School of Arts and Sciences](https://krieger.jhu.edu/)",
    "KSAS": "[KSAS](https://krieger.jhu.edu/)",
    "mc"  : "[Malone Center for Engineering in Healthcare](https://malonecenter.jhu.edu/)",
    "med" : "[Department of Medicine](https://www.hopkinsmedicine.org/medicine)",
    "skcc": "[The Sidney Kimmel Comprehensive Cancer Center](https://www.hopkinsmedicine.org/kimmel-cancer-center)",
    "som":  "[School of Medicine](https://www.hopkinsmedicine.org/som)",
    "SOM":  "[SOM](https://www.hopkinsmedicine.org/som)",
    "sph":  "[Bloomberg School of Public Health](https://publichealth.jhu.edu/)",
    "SPH":  "[SPH](https://publichealth.jhu.edu/)",
    "wse":  "[Whiting School of Engineering](https://engineering.jhu.edu/)",
    "WSE":  "[WSE](https://engineering.jhu.edu/)",
    "PUB": "https://www.ncbi.nlm.nih.gov/pmc/?term=Steven+L.+Salzberg%5Bau%5D+OR+Dan+Arking%5Bau%5D+OR+Joel+Bader%5Bau%5D+OR+Alexis+Battle%5Bau%5D+OR+Michael+Beer%5Bau%5D+OR+Jean+Fan%5Bau%5D+OR+Liliana+Florea%5Bau%5D+OR+Kasper+D.+Hansen%5Bau%5D+OR+Stephanie+Hicks%5Bau%5D+OR+Hongkai+Ji%5Bau%5D+OR+Rachel+Karchin%5Bau%5D+OR+Ben+Langmead%5Bau%5D+OR+Rajiv+McCoy%5Bau%5D+OR+Mihaela+Pertea%5Bau%5D+OR+Suchi+Saria%5Bau%5D+OR+Robert+Scharpf%5Bau%5D+OR+Michael+Schatz%5Bau%5D+OR+Margaret+Taub%5Bau%5D+OR+Winston+Timp%5Bau%5D+OR+Aleksey+Zimin%5Bau%5D&sort=pubdate"
}

html_context = {
    "PUB": "https://www.ncbi.nlm.nih.gov/pmc/?term=Steven+L.+Salzberg%5Bau%5D+OR+Dan+Arking%5Bau%5D+OR+Joel+Bader%5Bau%5D+OR+Alexis+Battle%5Bau%5D+OR+Michael+Beer%5Bau%5D+OR+Jean+Fan%5Bau%5D+OR+Liliana+Florea%5Bau%5D+OR+Kasper+D.+Hansen%5Bau%5D+OR+Stephanie+Hicks%5Bau%5D+OR+Hongkai+Ji%5Bau%5D+OR+Rachel+Karchin%5Bau%5D+OR+Ben+Langmead%5Bau%5D+OR+Rajiv+McCoy%5Bau%5D+OR+Mihaela+Pertea%5Bau%5D+OR+Suchi+Saria%5Bau%5D+OR+Robert+Scharpf%5Bau%5D+OR+Michael+Schatz%5Bau%5D+OR+Margaret+Taub%5Bau%5D+OR+Winston+Timp%5Bau%5D+OR+Aleksey+Zimin%5Bau%5D&sort=pubdate"
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
    "software/diamund/index" : "/software/alignment.html#diamund",
    "software/hisat2/index" : "/software/alignment.html#hisat2",
    "hisat-genotype/index" : "/software/alignment.html#hisat-genotype", #!!!
    "software/hisat/index" : "/software/alignment.html#hisat",
    "software/tophat/index" : "/software/alignment.html#tophat",

    "software/bracken/index" : "/software/metagenomics.html#bracken",
    "software/centrifuge/index" : "/software/metagenomics.html#centrifuge",
    "software/kraken2/index" : "/software/metagenomics.html#kraken2",
    "software/kraken/index" : "/software/metagenomics.html#kraken",
    "software/krakentools/index" : "/software/metagenomics.html#krakentools",
    "software/krakenuniq/index" : "/software/metagenomics.html#krakenuniq",
    "software/pavian/index" : "/software/metagenomics.html#pavian",

    "software/genesplicer/index" : "/software/gene_finding.html#genesplicer",
    "software/glimmerhmm/index" : "/software/gene_finding.html#glimmerhmm",
    "software/glimmer/index" : "/software/gene_finding.html#glimmer",
    "software/jigsaw/index" : "/software/gene_finding.html#jigsaw",
    "lifton/index" : "/software/gene_finding.html#lifton",

    "software/autoeditor/index" : "/software/genome_assembly.html#autoeditor",  #!!!
    "software/FLASH/index" : "/software/genome_assembly.html#flash",
    "gage_b/index" : "/software/genome_assembly.html#gage-b",
    "software/quake/index" : "/software/genome_assembly.html#quake",

    "eastr/index" : "/software/transcriptome_assembly.html#eastr",
    "software/EDGE-pro/index" : "/software/transcriptome_assembly.html#edge-pro",
    "software/stringtie/index" : "/software/transcriptome_assembly.html#stringtie",
    "software/tiebrush/index" : "/software/transcriptome_assembly.html#tiebrush",

    "software/BRCA-diagnostic/index" : "/software/other_tools.html#brca-gene-testing",
    "software/dive/index" : "/software/other_tools.html#dive",
    "software/ELPH/index" : "/software/other_tools.html#elph",
    "software/fqtrim/index" : "/software/other_tools.html#fqtrim",
    "OpenSpliceAI/index" : "/software/other_tools.html#openspliceai",
    "software/phymmbl/index" : "/software/other_tools.html#phymmbl",
    "splam/index" : "/software/other_tools.html#splam",

    "chess/index": "/data/data.html#chess",
    "HIV_Atlas/index": "/data/data.html#hiv_atlas",
    "T2T": "/data/data.html#T2T",

    "data/eupathDB/index": "/data/data.html#eupathDB",  #???

    "people/florea/index:": "https://florealab.org",
    "people/salzberg/index:": "https://salzberg-lab.org",
    "people/mpertea/index:": "https://pertealab.org",
}
