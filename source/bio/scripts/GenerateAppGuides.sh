#! /bin/bash
set -x
# This script generates documentation files based on the names of the missing biocontainers in listofmissingfiles.txt and then updates index.rst based on files in the 'source' folder
# listofmissingfiles.txt can be generated using generatelistofmissingfiles.sh
# Example Usage: ./generatedocumentation.sh
# Warning: Will not work if listofmissingfiles.txt does not exist
# Verify biocontainer input and documentation output paths before running

# Generate documentation for missing files using listofmissingfiles.txt

current_dir="$PWD" # save current directory 
cd ../../../ # go up to the repo parent directory
repo_path="$PWD" # assign path to repo_path
cd $current_dir # cd back to current directory
## Update application guides
app_folder="$repo_path/source/bio/apps/doc"
app_indexfile="$repo_path/source/bio/apps/index.md"
appsarray=`ls $app_folder`

cat <<'EOF' >>$app_indexfile
---
tags: bioinformatics
---
# Bioinformatics applications
Below are bioinformatics applications deployed by Tufts Research Technology.

```{gallery-grid}
:grid-columns: 1
:grid-rows: 16

EOF

for app in $appsarray
do
  description=$(awk '/^Introduction$/ {getline; getline; print}' $app_folder/$app/$app.rst) 
  echo "- header: \"{fas}\`dna;pst-color-primary\` $app\"" >>$app_indexfile
  echo "  content: \"$description\""  >>$app_indexfile 
  echo "  link: \"doc/$app/$app.html\"" >>$app_indexfile
  echo "" >> $app_indexfile
done

