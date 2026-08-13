git add .
git commit -m "added dl files "
git push

##########
#lychee .

cat ...  | grep wiki$ | perl -ane 'print "git clone $F[-1]\n";'  | sed 's|/wiki$|.wiki.git|' > ../other/git.all.sh
cat ../other/git.all.sh | sed 's|\/|\t|g' | sed 's|.git$||' | perl -ane 'print "lychee $F[-1] > $F[-1].log 2>&1\n"'  > ../other/lychess.all.sh
cat ../other/lychess.all.sh | parallel -j 6

grep -c ERROR *log | sed 's|:|\t|' | sort -k2,2n

##################

R=choosing-a-metagenomics-classifier
R=Bracken
R=krakentools

R=kraken
R=kraken2
R=pavian
R=EASTR
E=centrifuge

cd $R.wiki

lychee --cache=false . > ../${R}.wikilog1 2>&1
lychee --cache=false \
  --exclude '^https://github.com/.*/projects' --exclude '^https://github.com/marketplace' --exclude '^https://github.com/search/' --exclude '^https://github.githubassets.com/' \
  --accept 403  \
  https://github.com/dpuiu/$R/wiki/ > ../$R.wikilog2 2>&1
egrep 'ERROR|^\[404' ../${R}.wikilog?
nano ../${E}.wikilog?
git add *md ; git commit -m "fixed refs"; git push ;
grep -v -f ../../../software.grep *md | grep dpuiu
mkdir OLD ; cp -i *md OLD 
sed -i -f ../../../software.sed *.md
diff -y --suppress-common-lines Home.md OLD/Home.md 
chmod 000 OLD
cd -

######

Hi Jen,


We are updating the CCB website and would like to move software documentation from the CCB Software website to the corresponding GitHub project wiki pages. 
Executables, releases, and additional data files will be moved from https://ccb.jhu.edu/software/ to ftp://ftp.ccb.jhu.edu/pub/software/. 
Some older projects do not have GitHub repositories yet, so new repositories will need to be created.

For example, for Derrick's Kraken 2 project:
  Documentation: https://ccb.jhu.edu/software/kraken2/ ---> https://github.com/DerrickWood/kraken2/wiki  (already exists)
  Downloads:     /ccb/salz7-data/www/ccb.jhu.edu/html/software/kraken2/dl/ --->  /ccb/salz7-data/ftp.ccb/pub/software/kraken2/

Note: 
  No changes will be made to the official GitHub repositories. 
  GitHub wikis are separate repositories and are not included in a standard git clone.

The pages for each project have been converted from HTML to Markdown, manually reviewed, and temporarily uploaded to https://github.com/dpuiu/$R.wiki.git. 
Clone, review and update the Markdown files.  
Once you are satisfied with the content, you can add the pages to your project's wiki either individually through the GitHub web interface or all at once using the commands below.

########

#Jen's repos
R=Bracken                             # exiting
#R=krakentools                        # exiting
R=choosing-a-metagenomics-classifier  # new; for https://ccb.jhu.edu/software/choosing-a-metagenomics-classifier/ documentation

#owner id
O=jenniferlu717                       # owner id

#in the browser: click https://github.com/$O/$R.wiki to create a 1st page (ex: tmp.md to init the repo)

#git commands
git clone https://github.com/dpuiu/$R.wiki.git
cd $R.wiki
rm -rf .git
git init
git add .
git commit -m "Import wiki content"
git branch -M master
git remote add origin https://github.com/$O/$R.wiki.git
git push -u origin master
cd ..

#in the browser: click https://github.com/$O/$R.wiki to view the files
