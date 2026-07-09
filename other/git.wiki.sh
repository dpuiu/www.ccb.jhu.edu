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

S=choosing-a-metagenomics-classifier
S=kraken
S=kraken2
S=Bracken
S=pavian
S=krakentools
S=EASTR
S=centrifuge

cd $S.wiki

lychee --cache=false . > ../${S}.wikilog1 2>&1
lychee --cache=false \
  --exclude '^https://github.com/.*/projects' --exclude '^https://github.com/marketplace' --exclude '^https://github.com/search/' --exclude '^https://github.githubassets.com/' \
  --accept 403  \
  https://github.com/dpuiu/$S/wiki/ > ../$S.wikilog2 2>&1
egrep 'ERROR|^\[404' ../${S}.wikilog?
nano ../${S}.wikilog?
git add . ; git commit -m "fixed ERR"; git push ;

cd -
