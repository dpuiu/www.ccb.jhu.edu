#kraken2
#git clone https://github.com/DerrickWood/kraken2.wiki.git

#bracken
#git clone https://github.com/dpuiu/Bracken.wiki.git

#stringtie
#git clone https://github.com/dpuiu/stringtie.wiki.git

#hisat
#git clone https://github.com/dpuiu/stringtie.wiki.git

cat 1  | grep wiki$ | perl -ane 'print "git clone $F[-1]\n";'  | sed 's|/wiki$|.wiki.git|'
git clone https://github.com/dpuiu/choosing-a-metagenomics-classifier.wiki.git
git clone https://github.com/dpuiu/kraken.wiki.git
git clone https://github.com/dpuiu/Bracken.wiki.git
git clone https://github.com/dpuiu/krakentools.wiki.git
git clone https://github.com/dpuiu/EASTR.wiki.git
git clone https://github.com/dpuiu/centrifuge.wiki.git
git clone https://github.com/dpuiu/stringtie.wiki.git
git clone https://github.com/dpuiu/gffread.wiki.git
git clone https://github.com/dpuiu/gffcompare.wiki.git
git clone https://github.com/dpuiu/hisat2.wiki.git
git clone https://github.com/dpuiu/tophat.wiki.git
git clone https://github.com/dpuiu/glimmer.wiki.git
git clone https://github.com/dpuiu/glimmerhmm.wiki.git
git clone https://github.com/dpuiu/glimmerm.wiki.git
git clone https://github.com/dpuiu/flash.wiki.git
git clone https://github.com/dpuiu/fqtrim.wiki.git

##########

git add .
git commit -m "added dl files "
git push

##########

#lychee .

cat ../other/git.all.sh | sed 's|\/|\t|g' | sed 's|.git$||' | perl -ane 'print "lychee $F[-1] > $F[-1].log 2>&1\n"'  > ../other/lychess.all.sh
cat ../other/lychess.all.sh | parallel -j 6


grep -c ERROR *log  | sed 's|:|\t|' | sort -k2,2n
EASTR.wiki.log	0
fqtrim.wiki.log	0
gffread.wiki.log	0
choosing-a-metagenomics-classifier.wiki.log	1	0
krakentools.wiki.log	1	0

Bracken.wiki.log	2
centrifuge.wiki.log	3
flash.wiki.log	3
gffcompare.wiki.log	3
glimmerm.wiki.log	7
stringtie.wiki.log	7
hisat2.wiki.log	8
glimmerhmm.wiki.log	9
kraken.wiki.log	15
glimmer.wiki.log	44
tophat.wiki.log	50
