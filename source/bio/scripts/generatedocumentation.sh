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
mkdir -p $repo_path/source/bio/apps

readarray -t listofmissingfiles < listofmissingfiles.txt

for filename in ${listofmissingfiles[@]}; do
   inputfolder="$repo_path/source/bio/modules/$filename"
   filenamesarray=`ls $inputfolder/*`
  
   for eachfile in $filenamesarray
   do
      inputpath=$(echo "$eachfile" | awk '{sub(/\*$/, "")}1') #This assumes last file name in alphabetical order is the file to parse
   done
   
   version=$(echo $inputpath|awk -F'/' '{print $NF}')
   app=`basename $filename`
   toolsfolder="/cluster/tufts/biocontainers/tools/$app/$version/bin/"
   toolsarray=`ls $toolsfolder/*`
   containername=$(echo $inputpath | awk -F/ '{print $(NF-1)}')

   outputfile="$repo_path/source/bio/apps/$containername/$containername.rst"

   inputpathcontent=$(<$inputpath)  

   mkdir -p $repo_path/source/bio/apps/$containername

   echo ".. _backbone-label:" > $outputfile
   echo "" >> $outputfile
   echo "${containername^}" >> $outputfile
   echo "==============================" >> $outputfile
   echo "" >> $outputfile
   echo "Introduction" >> $outputfile
   echo "~~~~~~~~" >> $outputfile
   description=$(sed -n 's/module-whatis\s*"Description: \(.*\)"/\1/p' $inputpath)
   echo $description >> $outputfile
   echo "" >> $outputfile

   echo "Versions" >> $outputfile
   echo "~~~~~~~~" >> $outputfile
   for eachfile in $filenamesarray
   do
      echo "- `basename $eachfile`" >> $outputfile
   done
   echo "" >> $outputfile
   echo "Commands" >> $outputfile
   echo "~~~~~~~" >> $outputfile

   for command in $toolsarray
   do
   echo -n "- " >> $outputfile; echo `basename "$command"` >> $outputfile
   done

   echo "" >> $outputfile
   echo "Example job" >> $outputfile
   echo "~~~~~" >> $outputfile
   echo 'Adjust slurm options based on job requirements (`slurm cheat sheet <https://slurm.schedmd.com/pdfs/summary.pdf>`_)::' >> $outputfile
   echo "" >> $outputfile

cat <<EOF >>$outputfile
 #!/bin/bash
 #SBATCH -p partitionName  # batch, gpu, preempt, mpi or your group's own partition
 #SBATCH -t 1:00:00  # Runtime limit (D-HH:MM:SS)
 #SBATCH -N 1	# Number of nodes
 #SBATCH -n 1	# Number of tasks per node 
 #SBATCH -c 4	# Number of CPU cores per task
 #SBATCH --mem=8G	# Memory required per node
 #SBATCH --job-name=$containername	# Job name
 #SBATCH --mail-type=FAIL,BEGIN,END	# Send an email when job fails, begins, and finishes
 #SBATCH --mail-user=your.email@tufts.edu	# Email address for notifications
 #SBATCH --error=%x-%J-%u.err	# Standard error file: <job_name>-<job_id>-<username>.err
 #SBATCH --output=%x-%J-%u.out	# Standard output file: <job_name>-<job_id>-<username>.out

 module purge	### Optional, but highly recommended.
 module load $containername/XXXX	### Latest version is recommended. 

EOF
echo "" >> $outputfile
done


# Update index.rst using names of files in source folder

## Update tutorials
tutorialfolder="$repo_path/source/bio/tutorials/doc"
tutorial_indexfile="$repo_path/source/bio/tutorials/index.md"
tutorialsarray=`ls $tutorialfolder`

cat <<EOF >>$tutorial_indexfile
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
  title=`echo $eachfile | cut -d . -f 1 |sed 's/_/ /g'`
  echo "- header: \"{fas}`book;pst-color-primary` $title\"" >>$tutorial_indexfile
  echo "content: \"XXXX\""  >>$tutorial_indexfile 
  echo "link: \"tutorials/doc/$tutorial\"" >>$tutorial_indexfile
done
echo "" >> $tutorial_indexfile


## Update tutorials
#sed -i '/## Bioinformatics tutorials/,$d' $indexfile
#echo "## Bioinformatics tutorials" >> $indexfile
#echo "" >> $indexfile

#for eachfile in $tutorialsarray
#do
#  title=`echo $eachfile | cut -d . -f 1 |sed 's/_/ /g'`
#  echo "  - [$title](tutorials/$eachfile)"  >> $indexfile
#done
#echo "" >> $indexfile

## Update workshops
sed -i '/## Bioinformatics workshops/,$d' $indexfile
workshopfolder="$repo_path/source/bio/workshops"
years=$(ls -rd $workshopfolder/20*/)
echo "## Bioinformatics workshops" >> $indexfile
echo "" >> $indexfile
# Loop through each directory
for year in $years
do
  year=`basename $year`
  echo "### $year" >> $indexfile
  workshoparray=`ls $workshopfolder/$year`
  for workshop in $workshoparray
  do	  
	title=`echo $workshop | sed 's/\///g' | cut -d . -f 1 |sed 's/_/ /g'`
	echo "  - [$title](workshops/$year/$workshop/00_introduction.md)"  >> $indexfile
  done
done
echo "" >> $indexfile

## Update applications
#sourcefolder="$repo_path/source/bio/apps/"

#filenamesarray=`ls $sourcefolder`

#sed -i '/## Bioinformatics applications/,$d' $indexfile
#echo "## Bioinformatics applications" >> $indexfile
#echo "" >> $indexfile
#for eachfile in $filenamesarray
#do
#   echo "  - [$eachfile](apps/$eachfile/$eachfile.rst)" >> $indexfile
#done

## Add additional resources
#echo "" >> $indexfile
#cat <<EOF >> $indexfile
## Additional resources

#- [Datalab bioinformatics workshop 2024](https://tuftsdatalab.github.io/tuftsWorkshops/2024_workshops/readme/)
#- [TTS bioinformatics resources](https://it.tufts.edu/bioinformatics)
#- [Tufts Research Technology Bioinformatics Workshops Series](https://tuftsdatalab.github.io/Research_Technology_Bioinformatics/)
#- [BEST group bioinformatics workshops](https://best-tufts.github.io/bioinformatics_workshops/)

#> **_NOTE:_** Please note that some of the materials linked above may represent previous years’ content and could contain outdated information. Always verify the relevance and accuracy of the content before applying the techniques in your research projects.
#EOF

