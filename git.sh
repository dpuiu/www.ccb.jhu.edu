#git pull

make html
rm -r docs
cp -r _build/html docs
make clean


git status
git add .
git commit -m 'multiple updates'
git push
