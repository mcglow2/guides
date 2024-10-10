#!/bin/bash

# This script generates a list of biocontainers that are not in the git directory
# The output file is listofmissingfiles.txt and is used in generatedocumentation.sh
# Example usage: ./generatedocumentation.sh

current_dir="$PWD" # save current directory 
cd ../../../ # go up to the repo parent directory
repo_path="$PWD" # assign path to repo_path
cd $current_dir # cd back to current directory

biocontainers="$repo_path/source/bio/modules/"
gitfolders="$repo_path/source/bio/apps/"
echo $gitfolders
diff -q $gitfolders $biocontainers | grep "Only in" > tempfile.txt
awk 'NF{ print $NF }' tempfile.txt > listofmissingfiles.txt

rm tempfile.txt
