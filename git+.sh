#git pull
#git ls-remote  http://github.com/dpuiu/www.ccb.jhu.edu
#git ls-tree -r --name-only HEAD | grep OLD
#git rm -r --cached OLD/
#git rm -r --cached People/OLD/
#git check-ignore -v OLD
#git check-ignore -v */OLD

make html theme=furo
make html theme=pydata

#rm -r docs
#cp -r _build/html docs
rsync -a _build/furo/ docs/
rsync -a _build/pydata/ docs/pydata
make clean


git status
git add .
git commit -m 'multiple updates'
git push
