make clean
make html 
rm -r docs
cp -r _build/html docs


git status
git add .
git commit -m 'multiple updates'
git push
