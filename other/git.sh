#git pull
#git ls-remote  http://github.com/dpuiu/www.ccb.jhu.edu
#git ls-tree -r --name-only HEAD | grep OLD
#git rm -r --cached OLD/
#git rm -r --cached People/OLD/
#git check-ignore -v OLD
#git check-ignore -v */OLD

rm -r  _build docs
#make clean
make html html_theme=pydata_sphinx_theme
#make html html_theme=furo

rsync -a _build/pydata_sphinx_theme/ docs/
#rsync -a _build/furo/ docs/furo

git status
git add .
git commit -m 'multiple updates'
git push
