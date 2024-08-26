#! /bin/bash
#set -x
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
## Update tutorials
tutorialfolder="$repo_path/source/bio/tutorials/doc"
tutorial_indexfile="$repo_path/source/bio/tutorials/index.md"
tutorialsarray=`ls $tutorialfolder`

cat <<'EOF' >>$tutorial_indexfile
---
tags: bioinformatics_tutorials
---
# Bioinformatics tutorials
Training workshops on bioinformatics provided by Tufts Research Technology.

```{gallery-grid}
:grid-columns: 1
:grid-rows: 16

EOF

for tutorial in $tutorialsarray
do
  title=`echo $tutorial | cut -d . -f 1 |sed 's/_/ /g'`
  echo "- header: \"{fas}\`book;pst-color-primary\` $title\"" >>$tutorial_indexfile
  echo "  content: \"XXXX\""  >>$tutorial_indexfile 
  echo "  link: \"doc/$tutorial\"" >>$tutorial_indexfile
  echo "" >> $tutorial_indexfile
done
