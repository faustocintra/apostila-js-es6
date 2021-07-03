#!/bin/bash

echo "Building target PDF, please wait..."

if [[ -d ./.build ]]; then
    rm -rf ./.build/* > /dev/null
else 
    mkdir ./.build
fi

if [[ ! -d ./.build/img ]]; then mkdir ./.build/img; fi

if [[ -f ./dist/apostila-js.pdf ]]; then rm ./dist/apostila-js.pdf; fi

find src/ -name "*.md" -exec cp {} ./.build \;
find src/ -name "*.png" -exec cp {} ./.build/img \;

cd .build

#cat ./*.md > ./tmp.md

for f in *.md
do
  cat "$f" >> tmp.md
  printf '\n\n' >> tmp.md  
done

# pandoc --pdf-engine=lualatex --highlight-style ../src/.config/dracula.theme --toc --toc-depth=2 -V date=$(date +%d/%m/%Y%n) -F pandoc-crossref ./tmp.md -o "../dist/Apostila JavaScript - Prof. Fausto Cintra - $(date +%d-%m-%Y%n).pdf"

pandoc --pdf-engine=xelatex --highlight-style ../src/.config/dracula.theme --toc --toc-depth=2 -V date=$(date +%d/%m/%Y%n) -F pandoc-crossref ./tmp.md -o "../dist/Apostila JavaScript - Prof. Fausto Cintra - $(date +%d-%m-%Y%n).pdf"

cd ..

echo "Building done."