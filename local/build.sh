#!/bin/bash

# Get the current directory
currentDir=$(dirname "$0")

# Run the build.sh in the parent directory. This will produce the php-libraries:latest Docker image.
cd ..
./build.sh