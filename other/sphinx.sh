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

#get image info
find _static/Logos/ | xargs identify 
find _static/Logos/ | xargs identify  | egrep 'ccblogo_breathable_50.png|jhmilogo_wbg_50.png|jhsphlogo_wbg_50.png|jhu-wse-logo-white_50.png' 
_static/Logos/ccblogo_breathable_50.png PNG 166x60 166x60+0+0 8-bit sRGB 9709B 0.000u 0:00.000
_static/Logos/jhmilogo_wbg_50.png       PNG 196x75 196x75+0+0 8-bit sRGB 10068B 0.000u 0:00.000
_static/Logos/jhu-wse-logo-white_50.png PNG 208x60 208x60+0+0 8-bit sRGB 8070B 0.000u 0:00.000
_static/Logos/jhsphlogo_wbg_50.png      PNG 193x60 193x60+0+0 8-bit sRGB 12988B 0.000u 0:00.000
...

#ln ccblogotext_wbg_100.png logo.png
ln ccblogo_breathable.png  logo.png

convert ccblogo_breathable.png -resize x60  ccblogo_breathable_50.png
convert jhmilogo_wbg.png  -resize x60 jhmilogo_wbg_50.pn

#get logo info
identify logo.png 
identify -verbose logo.png 

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


#cd _build/html
#python3 -m http.server 8000
######

git switch main
git merge update-my-page
git pull
###

python3 -m http.server 8000 --directory docs/
####
ls *100* | perl -ane '/(.+)_100/; print "convert $1.png -resize x75 ${1}_100.png\n";' | bash
find . -name "*md" | xargs cat | grep ^####

	
#########

pip install mdformat mdformat-gfm mdformat-frontmatter --break-system-packages
mdformat .
mdformat --wrap 80  .

/_static/People$ ls | perl -lane '/(.+)\./; print "convert $F[0] $1.webp";' | bash
cat OLD/people.tsv | sed -E 's/\.(gif|jpg|png)/.webp/' | cut -f2 > people.tsv

##########

#check title
find docs/ -name "*html" | xargs grep -c "<title"  | grep -v ":1"
find docs/ -name "*html" | xargs grep -c "<h1"  | grep -v ":1"

find docs/ -name "*html" | xargs grep -c -P "<h1"    > other/h1
find docs/ -name "*html" | xargs grep -c -P "<h2"    > other/h2
find docs/ -name "*html" | xargs grep -c -P "<h3"    > other/h3
find docs/ -name "*html" | xargs grep -c -P "<h4"    > other/h4

paste other/h? | sed 's|:|\t|g' | perl -ane 'print if($F[1]==0 and $F[3]>0);'
paste other/h? | sed 's|:|\t|g' | perl -ane 'print if($F[3]==0 and $F[5]>0);'

############

#software

 cat software.txt   | perl -ane ' print "$1\n" if(/github.+\/(.+)\//); print "\n";'  | grep -v ^$ | sort | uniq -c | nl
     1	      1 cole-trapnell-lab
     2	      1 DaehwanKimLab
     3	      2 DerrickWood
     4	      1 dstreett
     5	      1 edwardsLab
     6	      1 fbreitwieser
     7	      1 gmes-glimmer
     8	      2 gpertea
     9	      1 infphilo
    10	      2 jenniferlu717
    11	      1 mdozmorov
    12	      1 salzberg-lab
    13	      1 yandell-lab

cat software.txt | perl -ane 'chomp; print $_; print " : $1" if(/github.+\/(.+)\//); print "\n";' > software.txt2
cat software.txt2  | grep git | perl -ane 'print "s|$F[3]|$F[5]/wiki|\n"' > software.sed1  # original
cat software.sed1  | sed 's|\||\t|g'   | p 'print "s\|$F[2]|$F[2]|\n";' > software.sed2    # dpuiu forks
cat software.sed2  | sed 's|\||\t|g'   | p 'print "s\|$F[2]|$F[1]|\n";' > software.sed3    # back to original
#######

#convert software pages
#pandoc ../software/eastr/settings/index.html  -f html  -t markdown   --wrap=auto  --columns=100  -o software/easter/settings.md --strip-comments   --from=html-native_divs
#pandoc ../software/eastr/index.html           -f html  -t markdown   --wrap=auto  --columns=100  -o software/easter/index.md    --strip-comments   --from=html-native_divs

salz:
cd /home/dpuiu/www.ccb.jhu.edu.html/md

######
#4. kraken2

cloned kraken2 and kraken2.wiki

Updated Kraken2 paper link: http://genomebiology with doi
RDP: https://github.com/rdpstaff/classifier

######
#eastr : ida (already have the MD files)
cd md/software/eastr
pandoc ../../../software/eastr/index.html           -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/eastr/settings/index.html  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > manual.md0

######### 
#5. bracken: jen
cd md/software/bracken

ll ../../../software/bracken/*shtml | sort -k5,5nr
-rw-rw-r--. 1 jlu26 salzberg_ifx 14700 Oct  3  2022 ../software/bracken/home.shtml
-rw-rw-r--. 1 jlu26 salzberg_ifx 14514 Oct  7  2019 ../software/bracken/manual.shtml
-rw-rw-r--. 1 jlu26 salzberg_ifx  1729 Oct 11  2018 ../software/bracken/index.shtml
#-rw-rw-r--. 1 jlu26 salzberg_ifx   390 Apr  6  2016 ../software/bracken/example.shtml

pandoc ../../../software/bracken/home.shtml      -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/bracken/manual.shtml    -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > manual.md0
pandoc ../../../software/bracken/example.shtml   -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > example.md0

nano *0
grep "www.ccb" *0
grep "http:" *0
grep ccb *0
grep shtml *0
grep -n "\[" *.md0  | grep -v "\]"
grep -n "](" *.md0  | grep -v "\["
grep -n "(#"  *.md0 
chmod a-w *0

cat home.md0     | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > home.md2
cat manual.md0   | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > manual.md2
cat example.md0 | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > example.md2
grep  "^#" home.md2  | perl -pe 'if (/^(#+)\s+(.*)$/){$t=$2;$id=lc$t;$id=~s/[^a-z0-9]+/-/g;$id=~s/^-|-$//g;$_="$id\n"}' # get header ids

nano *2
grep ccb *2
grep "http:" *2
grep -n "](" *.md2  | grep -v "\["
grep -n "](" *.md2  | grep -v "\]"
grep -n "(#"  *.md2 
paste home.md?   | grep ccb
paste manual.md? | grep ccb


###
ll ~/www.ccb.jhu.edu.html/software/bracken/dl/
total 24478
-rw-rw-r--. 1 jlu26 salzberg_ifx    21764 Oct 31  2017 bracken_v1.0.tgz			del
-rw-rw-r--. 1 jlu26 salzberg_ifx  4995859 Nov  3  2017 minibracken_files.tgz
drwxrwsr-x. 2 jlu26 salzberg_ifx        5 Jan 24  2019 minikraken2_v1
drwxrwsr-x. 2 jlu26 salzberg_ifx       10 Jan 30  2019 minikraken2_v2
-rw-rw-r--. 1 jlu26 salzberg_ifx  1900931 Oct 31  2017 minikraken_4GB_100mers_distrib.txt
-rw-rw-r--. 1 jlu26 salzberg_ifx  1873689 Feb 10  2018 minikraken_4GB_125mers_distrib.txt
-rw-rw-r--. 1 jlu26 salzberg_ifx  3381014 Feb 10  2018 minikraken_4GB_125mers.kraken_cnts del
-rw-rw-r--. 1 jlu26 salzberg_ifx  1772782 Nov  1  2017 minikraken_4GB_200mers_distrib.txt
-rw-rw-r--. 1 jlu26 salzberg_ifx  1918043 Nov  3  2017 minikraken_4GB_75mers_distrib.txt
-rw-rw-r--. 1 jlu26 salzberg_ifx  1918404 Oct 31  2017 minikraken_8GB_100mers_distrib.txt
-rw-rw-r--. 1 jlu26 salzberg_ifx  1848247 Feb 10  2018 minikraken_8GB_125mers_distrib.txt
-rw-rw-r--. 1 jlu26 salzberg_ifx  3319270 Feb 10  2018 minikraken_8GB_125mers.kraken_cnts del
-rw-rw-r--. 1 jlu26 salzberg_ifx  1664875 Nov  1  2017 minikraken_8GB_200mers_distrib.txt
-rw-rw-r--. 1 jlu26 salzberg_ifx  1980005 Nov  3  2017 minikraken_8GB_75mers_distrib.txt
-rw-rw-r--. 1 jlu26 salzberg_ifx 11360854 Nov 15  2017 seqid2taxid.map


also copied software to 
  salz:/ccb/salz7-data/ftp.ccb/pub/software/bracken/ !!! =>
  ftp://ftp.ccb.jhu.edu/pub/software/bracken/

sed 's|dl|ftp://ftp.ccb.jhu.edu/pub/software/bracken/|

#######
#2. kraken : derick
cd md/software/kraken

ll ../../../software/kraken/*html
-rw-rw-r--. 1 salzberg salzberg_ifx  9537 Sep 29  2022 ../../../software/kraken/index.shtml
#-rw-rw-r--. 1 jlu26    salzberg_ifx 43060 Oct 17  2017 ../../../software/kraken/MANUAL_2016.html
-rw-rw-r--. 1 gpertea  salzberg_ifx 46202 Oct 29  2018 ../../../software/kraken/MANUAL.html

pandoc ../../../software/kraken/index.shtml    -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/kraken/MANUAL.html    -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > manual.md0

cat home.md0     | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > home.md2
cat manual.md0   | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > manual.md2

also copied software to 
  salz:/ccb/salz7-data/ftp.ccb/pub/software/kraken/ !!! =>
  ftp://ftp.ccb.jhu.edu/pub/software/kraken/


#######
#krakentools : jen
cd md/software/krakentools
ll ../../../software/krakentools/*html


ll ../../../software/krakentools/*html
-rw-rw-r--. 1 jlu26 salzberg_ifx 11459 Dec 10  2020 ../../../software/krakentools/extractreads.shtml
-rw-rw-r--. 1 jlu26 salzberg_ifx  4568 Oct  3  2022 ../../../software/krakentools/home.shtml

pandoc ../../../software/krakentools/home.shtml         -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/krakentools/extractreads.shtml -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > manual.md0

cat home.md0     | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > home.md2
cat manual.md0   | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > manual.md2
####

#centrifuge: daewan
cd md/software/centrifuge
ll ../../../software/centrifuge/*html | sort -k5,5nr
-rw-rw-r--. 1 infphilo salzberg_ifx 84288 Feb  8  2017 ../../../software/centrifuge/manual.html
-rw-rw-r--. 1 infphilo salzberg_ifx 64136 Jun  6  2018 ../../../software/centrifuge/manual.inc.html
-rw-rw-r--. 1 infphilo salzberg_ifx  7099 Jun  8  2020 ../../../software/centrifuge/index.shtml

pandoc ../../../software/centrifuge/manual.inc.html -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"   > manual.md0
pandoc ../../../software/centrifuge/index.shtml     -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"   > home.md0
pandoc ../../../software/centrifuge/_sidebar.inc.shtml -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > _sidebar.md0


cat home.md0    | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > home.md2
cat manual.md0  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > manual.md2
cat _sidebar.md0 | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > _sidebar.md2

#####

# pavian: florian

ll ../../../software/pavian/*html | sort -k5,5nr
-rw-rw-r--. 1 fbreitwieser salzberg_ifx 2824 Oct 14  2020 ../../../software/pavian/home.shtml
-rw-rw-r--. 1 fbreitwieser salzberg_ifx  438 Jan  4  2017 ../../../software/pavian/manual.shtml

pandoc ../../../software/pavian/home.shtml     -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"   > home.md0
pandoc ../../../software/pavian/manual.shtml   -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"   > manual.md0

######

#1. choosing-a-metagenomics-classifier
pandoc ../../../software/choosing-a-metagenomics-classifier/index.shtml   -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"   > home.md0

######

#stringtie & gffcompare & gffread
ll ../../../software/stringtie/*html | sort -k5,5nr
-rw-rw-r--. 1 gpertea  salzberg_ifx 49304 Jun  5 11:42 ../../../software/stringtie/manual.shtml
-rw-rw-rw-. 1 gpertea  salzberg_ifx 39459 Apr 10  2017 ../../../software/stringtie/newman.shtml
-rw-rw-r--. 1 dmiller  salzberg_ifx 39029 Jun 16  2017 ../../../software/stringtie/dman.shtml
-rw-rw-r--. 1 mpertea  salzberg_ifx 38193 Apr 22  2020 ../../../software/stringtie/manual-prev3.shtml
-rw-rw-r--. 1 gpertea  salzberg_ifx 36781 Apr 10 15:18 ../../../software/stringtie/gffcompare.shtml
-rw-rw-r--. 1 dmiller  salzberg_ifx 34811 Jun 16  2017 ../../../software/stringtie/manual-prev2.shtml
-rw-rw-r--. 1 gpertea  salzberg_ifx 27119 Nov 14  2025 ../../../software/stringtie/history.shtml 
-rw-rw-r--. 1 jysohn23 salzberg_ifx 27007 Feb  4  2017 ../../../software/stringtie/manual2.html
-rw-rw-r--. 1 mpertea  salzberg_ifx 25955 Mar  3  2017 ../../../software/stringtie/manual-prev.shtml
-rw-rw-r--. 1 gpertea  salzberg_ifx 17106 Apr 10 15:18 ../../../software/stringtie/gff.shtml
-rw-rw-r--. 1 mpertea  salzberg_ifx 10490 Nov  3  2025 ../../../software/stringtie/home.prev.shtml
-rw-rw-r--. 1 gpertea  salzberg_ifx  9449 Nov 14  2025 ../../../software/stringtie/home.shtml
-rw-r--r--. 1 avaraby1 salzberg_ifx  9055 Jun 16  2017 ../../../software/stringtie/variation.shtml
-rw-rw-r--. 1 gpertea  salzberg_ifx  9052 Mar 12  2020 ../../../software/stringtie/faq.shtml
-rw-rw-r--. 1 mpertea  salzberg_ifx  8510 Apr 22  2020 ../../../software/stringtie/home-prev.shtml
-rw-rw-r--. 1 mpertea  salzberg_ifx  6663 Jun  3  2014 ../../../software/stringtie/index.old.shtml
-rw-rw-r--. 1 gpertea  salzberg_ifx  6125 Feb 22  2015 ../../../software/stringtie/stringtie.shtml
-rw-rw-r--. 1 gpertea  salzberg_ifx  5670 Apr  6  2016 ../../../software/stringtie/example.shtml
-rw-rw-r--. 1 gpertea  salzberg_ifx  1818 Jun 27  2017 ../../../software/stringtie/index.shtml

pandoc ../../../software/stringtie/manual.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > manual.md0
pandoc ../../../software/stringtie/home.shtml    -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/stringtie/history.shtml    -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > history.md0
pandoc ../../../software/stringtie/faq.shtml     -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > faq.md0
pandoc ../../../software/stringtie/gffcompare.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"    > gffcompare.md0
pandoc ../../../software/stringtie/gff.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"    > gff.md0

cat home.md0     | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > home.md2
cat history.md0     | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > history.md2
cat manual.md0   | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > manual.md2
cat faq.md0      | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > faq.md2
cat gffcompare.md0      | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > gffcompare.md2
cat gff.md0      | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > gff.md2

#issue:
du -hs dl/lung.bam 
571M	dl/lung.bam


########
# hisat -daewan

ll ../../../software/hisat/*html | sort -k5,5nr
-rw-rw-r--. 1 infphilo salzberg_ifx 84288 Sep  8  2015 ../../../software/hisat/manual.html
-rw-rw-r--. 1 infphilo salzberg_ifx 83899 Sep  8  2015 ../../../software/hisat/manual.inc.html
-rw-rw-r--. 1 gpertea  salzberg_ifx 82776 Jul 29  2014 ../../../software/hisat/manual.in.prev.html
-rw-rw-r--. 1 infphilo salzberg_ifx  5588 Sep  8  2015 ../../../software/hisat/index.shtml
-rw-rwxr--. 1 infphilo salzberg_ifx  4949 Jun 12  2014 ../../../software/hisat/right_side.shtml
-rw-rw-r--. 1 infphilo salzberg_ifx  4197 Oct 14  2017 ../../../software/hisat/sidebar.inc.shtml
-rw-rw-r--. 1 infphilo salzberg_ifx  1175 Sep  8  2015 ../../../software/hisat/faq.shtml
-rw-rw-r--. 1 infphilo salzberg_ifx  1080 Sep  8  2015 ../../../software/hisat/manual.shtml
-rw-rw-r--. 1 infphilo salzberg_ifx   786 Jun 30  2014 ../../../software/hisat/topbar.inc.shtml
-rw-rw-r--. 1 infphilo salzberg_ifx   423 Sep  8  2015 ../../../software/hisat/footer.inc.html
-rw-rw-r--. 1 infphilo salzberg_ifx   375 Jun 12  2014 ../../../software/hisat/tutorial.html
-rw-rw-r--. 1 infphilo salzberg_ifx   366 Jun 12  2014 ../../../software/hisat/index.html
-rw-rw-r--. 1 infphilo salzberg_ifx   360 Jun 12  2014 ../../../software/hisat/faq.html

pandoc ../../../software/hisat/manual.html  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > manual.md0
pandoc ../../../software/hisat/index.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/hisat/sidebar.inc.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"   > _sidebar.md0

cat home.md0     | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > home.md2
cat manual.md0   | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > manual.md2
cat _sidebar.md0   | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > _sidebar.md2

#######

#tophat

pandoc ../../../software/tophat/fusion_index.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > fusion_index.md0
pandoc ../../../software/tophat/fusion_tutorial.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > fusion_tutorial.md0
pandoc ../../../software/tophat/fusion_manual.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > fusion_manual.md0


cat home.md0      | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > home.md2
cat faq.md0       | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > faq.md2
cat igenomes.md0  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > igenomes.md2
cat manual.md0    | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > manual.md2
cat sidebar.md0   | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > sidebar.md2
cat tutorial.md0  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed1  | sed -f ~/www.ccb.jhu.edu.html/md/software.sed2 > tutorial.md2


#######

#edgo-pro
ll ../../../software/EDGE-pro/*html
-rw-rw-r--. 1 salzberg salzberg_ifx 3278 Jul 25  2013 ../../../software/EDGE-pro/index.shtml

pandoc ../../../software/EDGE-pro/index.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0

########

# elph

ll ../../../software/ELPH/*html
-rw-rw-r--. 1 gpertea salzberg_ifx 216623 Feb 11  2013 ../../../software/ELPH/arabidopsis.matrices.html
-rw-rw-r--. 1 gpertea salzberg_ifx 225923 Feb 11  2013 ../../../software/ELPH/arab_table_matrices.html
-rw-rw-r--. 1 gpertea salzberg_ifx   5325 Feb 11  2013 ../../../software/ELPH/Artistic_license.html
-rw-rw-r--. 1 gpertea salzberg_ifx   3695 Feb 11  2013 ../../../software/ELPH/background9rm.html
-rw-rw-r--. 1 gpertea salzberg_ifx  13556 Feb 11  2013 ../../../software/ELPH/background.html
-rw-rw-r--. 1 gpertea salzberg_ifx  88374 Feb 11  2013 ../../../software/ELPH/drosophila.matrices.html
-rw-rw-r--. 1 gpertea salzberg_ifx  16881 Feb 11  2013 ../../../software/ELPH/eseF9rm.html
-rw-rw-r--. 1 gpertea salzberg_ifx  12682 Feb 11  2013 ../../../software/ELPH/eseF.html
-rw-rw-r--. 1 gpertea salzberg_ifx   2499 Feb 11  2013 ../../../software/ELPH/ESEfinder.html
-rw-rw-r--. 1 gpertea salzberg_ifx   3560 Feb 11  2013 ../../../software/ELPH/index.html
-rw-rw-r--. 1 gpertea salzberg_ifx   3186 Mar 29  2013 ../../../software/ELPH/index.shtml
-rw-rw-r--. 1 gpertea salzberg_ifx   5340 Feb 11  2013 ../../../software/ELPH/info_candidates.html
-rw-rw-r--. 1 gpertea salzberg_ifx  10673 Feb 11  2013 ../../../software/ELPH/man.shtml

pandoc ../../../software/ELPH/index.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/ELPH/man.shtml    -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua  | grep -v "div"  > manual.md0

########

# quake
ll ../../../software/quake/*shtml
-rw-rw-r--. 1 canton salzberg_ifx 8718 Jun 17  2013 ../../../software/quake/faq.shtml
-rwxrwxr-x. 1 canton salzberg_ifx 5301 Jun 17  2013 ../../../software/quake/index.shtml
-rw-rw-r--. 1 canton salzberg_ifx 6849 Jun 17  2013 ../../../software/quake/manual.shtml

pandoc ../../../software/quake/index.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/quake/manual.shtml -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > manual.md0
pandoc ../../../software/quake/faq.shtml    -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > faq.md0

###########
#BRCA-diagnostic
ll ../../../software/BRCA-diagnostic/*.shtml
-rw-rw-r--. 1 canton salzberg_ifx 3064 Mar 29  2013 ../../../software/BRCA-diagnostic/index.shtml

pandoc ../../../software/BRCA-diagnostic/index.shtml  -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div" > home.md0

##########

#jigsaw

ll ../../../software/jigsaw/*.shtml
-rw-rw-r--. 1 canton salzberg_ifx 14037 Aug 27  2013 ../../../software/jigsaw/index.shtml
-rw-rw-r--. 1 canton salzberg_ifx 14831 Aug 27  2013 ../../../software/jigsaw/README_tutorial.shtml

pandoc ../../../software/jigsaw/index.shtml -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0
pandoc ../../../software/jigsaw/README_tutorial.shtml -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  

#dive
ll ../../../software/dive/*html
-rw-rw-r--. 1 gpertea salzberg_ifx 3064 May 28  2013 ../../../software/dive/index.shtml

pandoc ../../../software/dive/index.shtml -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"  > home.md0

#diamund

ll ../../../software/diamund/*html
-rw-rw-r--. 1 canton salzberg_ifx 8971 Aug 18  2018 ../../../software/diamund/index.shtml

pandoc ../../../software/diamund/index.shtml -f html  -t gfm   --wrap=auto  --columns=100   --strip-comments  --lua-filter=../../clean.lua | grep -v "div"   > home.md0

######
ls | grep wiki | perl -ane 'print "lychee $F[0] > $F[0]log 2>&1\n";' > ../other/lychess.all.sh 

########

ll
total 164
drwxrwxr-x  4 dpuiu dpuiu  4096 Jul 14 12:10 ./
drwxrwxr-x 37 dpuiu dpuiu  4096 Jul 14 10:27 ../
drwxrwxr-x  2 dpuiu dpuiu  4096 Jul  8 17:53 downloads/
-rw-rw-r--  1 dpuiu dpuiu  4697 Jul 14 10:56 FAQ.md
-rw-rw-r-- 10 dpuiu dpuiu   276 Jul 14 11:05 _Footer.md
-rw-rw-r--  1 dpuiu dpuiu  3946 Jul 14 12:09 Fusion-Home.md
-rw-rw-r--  1 dpuiu dpuiu  7897 Jul 14 12:09 Fusion-Manual.md
-rw-rw-r--  1 dpuiu dpuiu  8758 Jul 14 11:54 Fusion-Tutorial.md
drwxrwxr-x  8 dpuiu dpuiu  4096 Jul 14 12:03 .git/
-rw-rw-r--  1 dpuiu dpuiu 45913 Jul 14 11:05 Home.md
-rw-rw-r--  1 dpuiu dpuiu 10150 Jul 14 10:15 Igenomes.md
-rw-rw-r--  1 dpuiu dpuiu 34236 Jul 14 10:09 Manual.md
-rw-rw-r--  1 dpuiu dpuiu  3345 Jul 14 12:05 _Sidebar.md
-rw-rw-r--  1 dpuiu dpuiu 11568 Jul 14 10:57 Tutorial.md
	

##########################
#openspliceai
git clone https://github.com/dpuiu/OpenSpliceAI
git clone https://github.com/dpuiu/OpenSpliceAI.wiki

pandoc /home/dpuiu/www.ccb.jhu.edu.html/openspliceai/index.html -f html   -t markdown   --markdown-headings=atx   --wrap=none > Home.md1
pandoc ../OpenSpliceAI/docs/source/index.rst -f rst  -t markdown   --markdown-headings=atx   --wrap=none  >Home.md2

pip install rst-to-myst --break-system-packages
/home/dpuiu/.local/bin/rst2myst convert ../OpenSpliceAI/docs/source/index.rst 
#=>../OpenSpliceAI/docs/source/index.md 

#pandoc -f html -t myst

########
cat README.md | sed 's|\$GITHUB_USERNAME|dpuiu0|g'   > README.dpuiu0.md
cat README.md | sed 's|\$GITHUB_USERNAME|sande125|g' > README.sande125.md

git add README.*md ; git commit -m "multiple updates"; git push

#####

#catch build errors
sphinx-build \
  --nitpicky \
  --warning-is-error \
  --keep-going \
  --fresh-env \
  --write-all


convert 1_chess-app-MT.webp -resize 1200x650^ 1_chess-app-MT-2.webp
convert 2_chess-app-expression.webp -resize 1200x650^ 2_chess-app-expression-2.webp 
convert 3_chess-app-isoforms.webp -resize 1200x650^ 3_chess-app-isoforms-2.webp 
convert 4_hiv_atlas.webp  -resize 1200x650^ 4_hiv_atlas-2.webp
convert 5_CHM13_annotation.webp -resize 1200x650^ 5_CHM13_annotation-2.webp
convert 6_LiftOn_human_mane_circos.webp -resize 1200x650^ 6_LiftOn_human_mane_circos-2.webp
convert 7_splam.webp -resize 1200x650^ 7_splam-2.webp
convert 8_tcga.webp -resize 1200x650^ 8_tcga-2.webp
convert 9_wbp.webp -resize 1200x650^ 9_wbp-2.webp

convert 1_chess-app-MT.webp -resize 1000x450! -bordercolor white  -border 100  1_chess-app-MT-2.webp
convert 2_chess-app-expression.webp -resize 1000x450! -bordercolor white  -border 100  2_chess-app-expression-2.webp 
convert 3_chess-app-isoforms.webp -resize 1000x450! -bordercolor white  -border 100 3_chess-app-isoforms-2.webp 
convert 4_hiv_atlas.webp  -resize 1000x450! -bordercolor white  -border 100 4_hiv_atlas-2.webp
convert 5_CHM13_annotation.webp -resize 1000x450! -bordercolor white  -border 100 5_CHM13_annotation-2.webp
convert 6_LiftOn_human_mane_circos.webp -resize 1000x450! -bordercolor white  -border 100 6_LiftOn_human_mane_circos-2.webp
convert 7_splam.webp -resize 1000x450! -bordercolor white  -border 100 7_splam-2.webp
convert 8_tcga.webp -resize 1000x450! -bordercolor white  -border 100 8_tcga-2.webp
convert 9_wbp.webp -resize 1000x450! -bordercolor white  -border 100 9_wbp-2.webp

