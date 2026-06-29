#using pydata_sphinx_theme (default)
make html html_theme=pydata_sphinx_theme
rsync -a  _build/pydata_sphinx_theme/ docs/

#using a differnt theme (ex furo)
#make html html_theme=furo
#rsync -a  _build/furo/ docs/furo

#clean
#make clean
