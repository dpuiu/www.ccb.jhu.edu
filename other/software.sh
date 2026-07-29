#!/bin/bash -eux

R=$1 #choosing-a-metagenomics-classifier
O=$2 #jenniferlu717
U=$3 #dpuiu

# Clone source wiki
git clone https://github.com/$U/$R.wiki.git
cd $R.wiki

# Remove source git history
rm -rf .git

# Create new git repository
git init
git add .
git commit -m "Import wiki content from $U"

# GitHub wikis traditionally use master
git branch -M master

# Add destination wiki
git remote add origin https://github.com/$O/$R.wiki.git

# Push
git push -u origin master
