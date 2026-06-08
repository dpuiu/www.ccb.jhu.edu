#git pull

make html
rsync -av --delete _build/html/ docs/
make clean


git status
git add .
git commit -m 'multiple updates'
git push
