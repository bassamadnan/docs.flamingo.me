#!/bin/bash

# Supposed to run as last build step

mkdir -p docs/site/examples/

echo "*****Clone the example projects HELLOWORLD"
cd workspace/example-helloworld
git pull --all
cd ..
zip example-helloworld.zip example-helloworld
mkdir -p docs/site/examples/
cp example-helloworld.zip docs/site/examples/




echo "*****Clone the example projects  FLAMINGO CAROTENE HELLO WORLD"

cd example-hello-flamingo-carotene
git pull --all

cd frontend
docker run --rm -w "/tmp" -v ${PWD}:/tmp aoepeople/carotene-env:1.7.0  "yarn"


cd ../..
zip example-hello-flamingo-carotene.zip example-hello-flamingo-carotene

cp example-hello-flamingo-carotene.zip docs/site/examples/


echo "DONE :-)"
