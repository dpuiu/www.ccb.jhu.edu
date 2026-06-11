make html html_theme=furo
make html html_theme=pydata_sphinx_theme

rsync -a  _build/pydata_sphinx_theme/ docs/
rsync -a  _build/furo/ docs/pydata
#make clean
