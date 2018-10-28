#!/usr/bin/env bash
cd ..
git clone https://${GITHUB_API_KEY}@github.com/CreunaFI/dominant-color-async-packagist-release.git
rsync -av --progress dominant-color-async/ dominant-color-async-packagist-release/ --exclude .git --exclude node_modules
git config --global user.email "johannes@siipo.la"
git config --global user.name "Johannes Siipola"
cd dominant-color-async-packagist-release
git add -A -f
git commit -m "Release $TRAVIS_TAG"
git tag "$TRAVIS_TAG"
git push
git push --tags