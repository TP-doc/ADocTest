#!/bin/bash --login

git checkout --orphan gh-pages

rvm install 2.1.1
source .rvmrc
bundle install

OUTPUT_DIR="public"

if [ ! -d $OUTPUT_DIR ]; then
  mkdir $OUTPUT_DIR
fi

echo "Generate asciidoctor documentation"
bundle exec rake generate[$OUTPUT_DIR]

echo "Publish to ewegithub pages"
git add public/
git commit -am "Publish new version"
git push origin `git subtree split --prefix $OUTPUT_DIR gh-pages`:refs/heads/gh-pages --force
