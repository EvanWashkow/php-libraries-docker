#!/bin/bash

# Get the current directory
currentDir=$(dirname $(realpath $0))

# Run the build.sh in the parent directory. This will produce the php-libraries:latest Docker image.
cd ..
./build.sh

# Build the image in the current directory
cd $currentDir
docker build --tag php-libraries:local .