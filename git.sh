#git ls-remote  http://github.com/dpuiu/www.ccb.jhu.edu
#git ls-tree -r --name-only HEAD
#git pull
git rm -r --cached OLD/
git rm -r --cached People/OLD/


make html
#rm -r docs
#cp -r _build/html docs
#rsync _build/html docs
make clean


git status
git add .
git commit -m 'multiple updates'
git push
