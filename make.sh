make html theme=furo
make html theme=pydata

rsync -a _build/furo/ docs/
rsync -a _build/pydata/ docs/pydata
make clean
