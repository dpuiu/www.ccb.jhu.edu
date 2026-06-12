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
convert ccblogo_wbg.png ccbtext_wbg.png +append ccblogotext_wbg.png
convert ccbtext_wbg.png -resize x100 ccbtext_wbg_100.png
convert ccblogo_wbg.png -resize x100 ccblogo_wbg_100.png
convert ccblogo_wbg_100.png ccbtext_wbg_100.png +append ccblogotext_wbg_100.png
convert ccblogo_wbg.png ccbtext_wbg.png +append ccblogotext_wbg.png

make clean
make html 
rm -r docs
cp -r _build/html docs

git status
git add .
git commit -m 'multiple updates'
git push

python -m py_compile conf.py

<<<<<<< HEAD
##########

cat people.md1 | grep -B 1 ^$ | perl -lane 'print $1 if(/(\wiki.+)\)/);' > people.md1.pics

=======
#################

cat people.md | grep name | sed 's|{{#ccbp: \|name=||' > people.md.name
cat people.md | grep photo | sed 's|\|photo=||' > people.md.photo
cat people.md | grep position| sed 's|\|position=||' | sed 's|<br/>|<br>|g' > people.md.position
cat people.md | grep email| sed 's|\|email=||' | sed 's|}}||' > people.md.email
cat people.md | grep affiliation| sed 's|\|affiliation=||' | \
 sed 's|{{IGM}}|Department of Genetic Medicine|' |\
 sed 's|{{SPH}}|School of Public Health|'  |\
 sed 's|{{JHU}}|Johns Hopkins University|' |\
 sed 's|}}||' | sed 's|<br/>|<br>|g' > people.md.affiliation
cat people.md | grep "url" | egrep -v 'laburl|xurl' | sed 's|\|url=||' | sed 's|}}||' > people.md.url
cat people.md | grep "laburl" | sed 's|\|laburl=||' | sed 's|}}||'  > people.md.laburl

find wiki/uploads/ | grep -i -f people.md.photo | grep -v thumb > people.md.photo+ # on salz
cat People/people.md.photo+| perl -ane 'print "scp dpuiu\@dslogin01.pha.jhu.edu:/home/dpuiu/www.ccb.jhu.edu.html/$F[0] _static/People\n";' | bash
paste People/people.md.name  People/people.md.photo  People/people.md.position   People/people.md.email People/people.md.affiliation People/people.md.url People/people.md.laburl  > People/people.tsv 
cat People/people.tsv|   ./people2grid.pl   | sed 's|<br>|\n- |g' > People/people.md 
#25,4,3,7
head -1 people.tsv 
name  photo  position   email affiliation url laburl  



#####



cat collab.csv  | sed "s|', '|\t|g" | sed "s|','|\t|g" | sed "s|'||g"  > collab.tsv
cut -f1 collab.tsv   > collab.md.name
cut -f2 collab.tsv   > collab.md.position
cut -f3 collab.tsv   > collab.md.photo
cut -f4 collab.tsv   | sed 's|Currently:||' | sed 's|<br/>|<br>|g' | sed 's|</br>|<br>|g' | sed 's|<br><br>|<br>|g'> collab.md.affiliation
cut -f5 collab.tsv   > collab.md.email
cut -f6 collab.tsv   > collab.md.laburl
 
paste collab.md.name collab.md.photo collab.md.position collab.md.email collab.md.affiliation collab.md.laburl > collab.tsv
cat collab.tsv | ./people2grid.pl   | sed 's|<br>|\n- |g'


#####

csplit software.md /"^### "/ '{*}' -f software_

#####

sudo npm install -g markdownlint-cli

markdownlint *.md
markdownlint --fix *.md

######

echo "## Faculty" > People/faculty.md
echo >> People/faculty.md 
grep -v ^# People/people.tsv| head -25| ./people2grid.pl   >> People/faculty.md

echo "## Postdocs" > People/postdocs.md
echo >> People/postdocs.md
grep -v ^# People/people.tsv| head -29 | tail -n 4 | ./people2grid.pl   >> People/postdocs.md


echo "## Staff" > People/staff.md
echo >> People/staff.md
grep -v ^# People/people.tsv| head -32 | tail -n 3 | ./people2grid.pl   >> People/staff.md

echo "## Students" > People/students.md
echo >> People/students.md
grep -v ^# People/people.tsv| head -39 | tail -n 7 | ./people2grid.pl   >> People/students.md


echo "## Alumni" > People/alumni.md
echo >> People/alumni.md
grep -v ^# People/people.tsv| head -45 | tail -n 6 | ./people2grid.pl   >> People/alumni.md

echo "## Collaborations" > People/collab.md
echo >> People/collab.md
tail -n 9 People/people.tsv | ./people2grid.pl   >> People/collab.md

#25,4,3,7, 6,9

######

pip install -r requirements.txt  --break-system-package

pandoc "https://ccb.jhu.edu/people/alekseyz/index.shtml?t=papers"   -f html   -t markdown   --wrap=none   --strip-comments   --to=plain >> publications.md 
pandoc "https://ccb.jhu.edu/people/alekseyz/index.shtml?t=software"  -f html   -t markdown   --wrap=none   --strip-comments   --to=plain >> software.md 
######

markdownlint People/*md 2>&1 | grep -f .markdownlint.ids

markdownlint --fix . 
markdown lint .

markdownlint . 2>&1  | sed 's| |\t|g' | cut -f3 | sort | uniq -c | sort -nr

###

#URL check
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install lychee

lychee .
lychee About/ --skip-missing=true --insecure=true --exclude mailto: -vv


#####

find _static/Logos/ | xargs identify  | egrep 'ccblogo_breathable_50.png|jhmilogo_wbg_50.png|jhsphlogo_wbg_50.png|jhu-wse-logo-white_50.png' 
_static/Logos/ccblogo_breathable_50.png PNG 166x60 166x60+0+0 8-bit sRGB 9709B 0.000u 0:00.000

_static/Logos/jhmilogo_wbg_50.png       PNG 196x75 196x75+0+0 8-bit sRGB 10068B 0.000u 0:00.000
_static/Logos/jhu-wse-logo-white_50.png PNG 208x60 208x60+0+0 8-bit sRGB 8070B 0.000u 0:00.000
_static/Logos/jhsphlogo_wbg_50.png      PNG 193x60 193x60+0+0 8-bit sRGB 12988B 0.000u 0:00.000


#ln ccblogotext_wbg_100.png logo.png
ln ccblogo_breathable.png  logo.png

 convert ccblogo_breathable.png -resize x60  ccblogo_breathable_50.png
 convert jhmilogo_wbg.png  -resize x60 jhmilogo_wbg_50.pn

#########
#git checkout -b picture-update
cd _static/Logos/

#color histogram
convert ccblogo_breathable_50.png -format %c histogram:info: | sort -nr | head
          2716: (22,65,117,255) #164175FF srgba(22,65,117,1)
          1024: (55,94,153,255) #375E99FF srgba(55,94,153,1)
           284: (21,64,116,255) #154074FF srgba(21,64,116,1)
           151: (30,72,125,255) #1E487DFF srgba(30,72,125,1)


convert ccblogo_breathable_50.png  -fuzz 15% -transparent "#164175FF"   ccblogo_breathable_50_transparent.png 

#####

find /home/dpuiu/Downloads/Logos | grep -i white |  grep horizontal | grep -v MAC | grep SVG
/home/dpuiu/Downloads/Logos/Johns Hopkins University Logos/RGB (Digital)/SVG/JHU.logo_horizontal.white.svg
/home/dpuiu/Downloads/Logos/School of Medicine Logos/RGB (Digital)/SVG/SOM.logos.rgb_horizontal.white.svg
/home/dpuiu/Downloads/Logos/Bloomberg School of Public Health Logos/RGB (Digital)/SVG/BSPH.logo.rgb_horizontal.white.svg

find /home/dpuiu/Downloads/Logos | grep -i white |  grep horizontal | grep -v MAC | grep PNG
/home/dpuiu/Downloads/Logos/Johns Hopkins University Logos/RGB (Digital)/PNG/JHU.logo_horizontal.white.png
/home/dpuiu/Downloads/Logos/School of Medicine Logos/RGB (Digital)/PNG/SOM.logos.rgb_horizontal.white.png
/home/dpuiu/Downloads/Logos/Bloomberg School of Public Health Logos/RGB (Digital)/PNG/BSPH.logo.rgb_horizontal.white.png


convert JHU.logo_horizontal.white.png -resize x130 JHU.logo_horizontal.white_130.png
