#! /bin/bash
set -x

current_dir="$PWD" # save current directory 
cd ../../../ # go up to the repo parent directory
repo_path="$PWD" # assign path to repo_path
cd $current_dir # cd back to current directory
## Update workshops
workshop_folder="$repo_path/source/bio/workshops/doc"
wopkshop_indexfile="$repo_path/source/bio/workshops/index.md"
workshopsarray=`ls $workshop_folder`

cat <<'EOF' >>$wopkshop_indexfile
---
tags: bioinformatics
---
# Bioinformatics workshops
Training workshops on bioinformatics provided by Tufts Research Technology.

```{gallery-grid}
:grid-columns: 1
:grid-rows: 16

EOF

years=$(ls -rd $workshop_folder/20*/)
# Loop through each directory
for year in $years
do
  year=`basename $year`
  workshoparray=`ls $workshop_folder/$year`
  for workshop in $workshoparray
  do	  
	title=`echo $workshop | sed 's/\///g' | cut -d . -f 1 |sed 's/_/ /g'`
  echo "- header: \"{fas}\`dna;pst-color-primary\` $title -- $year\"" >>$wopkshop_indexfile
  echo "  content: \"XXXX\""  >>$wopkshop_indexfile
  echo "  link: \"doc/$year/$title/00_introduction.html\"" >>$wopkshop_indexfile
  echo "" >> $wopkshop_indexfile
  done
done
# for tutorial in $workshopsarray
# do
#   title=`echo $tutorial | cut -d . -f 1 |sed 's/_/ /g'`
#   echo "- header: \"{fas}\`dna;pst-color-primary\` $title\"" >>$tutorial_indexfile
#   echo "  content: \"XXXX\""  >>$tutorial_indexfile 
#   echo "  link: \"doc/$tutorial\"" >>$tutorial_indexfile
#   echo "" >> $tutorial_indexfile
# done
