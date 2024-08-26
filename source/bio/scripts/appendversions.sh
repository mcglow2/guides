#! /bin/bash
#set -x
# This script updates the versions section of all the files in the source folder
# Example Usage: ./appendversions.sh
# Warning: Will not work unless name is exact match with both biocontainer and .rst documentation file 
# Verify biocontainer input and documentation output paths before running

current_dir="$PWD" # save current directory 
cd ../../../ #go up to the repo parent directory
repo_path="$PWD" # assign path to repo_path

sourcefolder="$repo_path/source/bio/apps/"
containernamesarray=`ls $sourcefolder`

cd $current_dir 

for containername in $containernamesarray
do
    inputfolder="$repo_path/source/bio/modules/$containername/"

    outputfile="$sourcefolder$containername/$containername.rst"
    echo "~~~~~~~~" > tempfile.rst
    filenamesarray=`ls $inputfolder*`

    for eachfile in $filenamesarray
    do
         echo "- `basename $eachfile`" >> tempfile.rst
    done
    echo "" >> tempfile.rst

    lead='^Versions$'
    tail='^Commands$'
    output=$(sed -e "/$lead/,/$tail/{ /$lead/{p; r tempfile.rst
        }; /$tail/p; d }"  $outputfile)
    echo "$output" > $outputfile
    
done
rm tempfile.rst
