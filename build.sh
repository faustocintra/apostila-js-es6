#!/bin/bash

echo "Building target PDF, please wait..."

if [[ -d ./.build ]]; then
    rm -rf ./.build/* > /dev/null
else 
    mkdir ./.build
fi

if [[ ! -d ./.build/img ]]; then mkdir ./.build/img; fi

if [[ -d ./dist ]]; then
    rm -rf ./dist/* > /dev/null
else 
    mkdir ./dist
fi

cp ./src/.config/00pre.md ./.build/tmp.md
printf '\n\n' >> ./.build/tmp.md

for f in ./src/*.md
do
  cat "$f" >> ./.build/tmp.md
  printf '\n\n' >> ./.build/tmp.md  
done

printf '\n\n' >> ./.build/tmp.md
cat ./src/.config/ZZpost.md >> ./.build/tmp.md

cd src/

pandoc --pdf-engine=lualatex --highlight-style ./.config/custom.theme --toc --toc-depth=3 -V date=$(date +%d/%m/%Y%n) -F pandoc-crossref ../.build/tmp.md -o "../dist/Apostila JavaScript - Prof. Fausto Cintra - $(date +%d-%m-%Y%n).pdf"

# pandoc --pdf-engine=lualatex --template=./.config/template.tex --highlight-style ./.config/custom.theme --toc --toc-depth=3 -V date=$(date +%d/%m/%Y%n) -F pandoc-crossref ../.build/tmp.md -o "../dist/Apostila JavaScript - Prof. Fausto Cintra - $(date +%d-%m-%Y%n).pdf"

cd ..

echo "Building done."