#installl
pip install sphinx --break-system-packages
sphinx-build --version
sphinx-build 9.1.0

#mkdir
cd ~/projects
mkdir sphinx
cd sphinx

#init
sphinx-quickstart

#build
make clean
make html

#install requirements.
cat requirements.txt 
 sphinx-rtd-theme
 furo
 myst-parser
 sphinx-copybutton
pip install -r requirements.txt --break-system-packages

#open browser
cd _build/html
python3 -m http.server 8000
#use: http://localhost:8000/Vega.html

#favicon/logo
#download svg to _static
convert favicon.svg -define icon:auto-resize=64,48,32,16 favicon.ico
convert favicon.svg logo.png

############

cat sitemap.txt | grep shtml  | p '/(\w+)\.shtml/; print "pandoc -f html -t markdown -o md/$1.md -i $1.shtml\n";' 
pandoc -f html -t markdown -o md/index.md -i index.shtml
pandoc -f html -t markdown -o md/about.md -i about.shtml
pandoc -f html -t markdown -o md/publications.md -i publications.shtml
pandoc -f html -t markdown -o md/jobs.md -i jobs.shtml
pandoc -f html -t markdown -o md/contact.md -i contact.shtml
pandoc -f html -t markdown -o md/software.md -i software.shtml
pandoc -f html -t markdown -o md/downloads.md -i downloads.shtml
pandoc -f html -t markdown -o md/students.md -i students.shtml
pandoc -f html -t markdown -o md/courses.md -i courses.shtml
pandoc -f html -t markdown -o md/internship.md -i internship.shtml
pandoc -f html -t markdown -o md/cbcc.md -i cbcc.shtml


############

convert jhu-wse-logo-white.png -resize x40 jhu-wse-logo-white_50.png
convert ccbtext_wbg.png -resize x40 ccbtext_wbg_50.png
convert ccblogo_wbg.png -resize x40 ccblogo_wbg_50.png
convert ccblogo_wbg_50.png ccbtext_wbg_50.png +append ccblogotext_wbg_50.png
convert jhsphlogo_wbg.png  -resize x40 jhsphlogo_wbg_50.png
convert jhmilogo_wbg.png -resize x40 jhmilogo_wbg_50.png


make clean
make html 
rm -r docs
cp -r _build/html docs



git status
git add .
git commit -m 'multiple updates'
git push

python -m py_compile conf.py

##########

cat people.md1 | grep -B 1 ^$ | perl -lane 'print $1 if(/(\wiki.+)\)/);' > people.md1.pics

