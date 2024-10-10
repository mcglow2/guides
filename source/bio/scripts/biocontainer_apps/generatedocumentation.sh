#! /bin/bash
set -x
# This script generates documentation files based on the names of the missing biocontainers in listofmissingfiles.txt and then updates index.rst based on files in the 'source' folder
# listofmissingfiles.txt can be generated using generatelistofmissingfiles.sh
# Example Usage: ./generatedocumentation.sh
# Warning: Will not work if listofmissingfiles.txt does not exist
# Verify biocontainer input and documentation output paths before running

# Generate documentation for missing files using listofmissingfiles.txt

current_dir="$PWD" # save current directory 
cd ../../../../ # go up four directories
repo_path="$PWD" # assign path to repo_path
cd $current_dir # cd back to current directory
mkdir -p $repo_path/source/bio/apps

readarray -t listofmissingfiles < listofmissingfiles.txt

for filename in ${listofmissingfiles[@]}; do
   inputfolder="/cluster/tufts/biocontainers/modules/$filename"
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
   echo "To run $containername on our clusters::" >> $outputfile
   echo "Different slurm options can be found in this [cheat sheet](https://slurm.schedmd.com/pdfs/summary.pdf)" >> $outputfile
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

 module purge
 module load $containername/XXXX ### you can run *module avail $containername* to check all available versions

EOF
echo "" >> $outputfile
done


# Update index.rst using names of files in source folder
## Update tutorials
tutorialfolder="$repo_path/source/bio/tutorials/"
indexfile="$repo_path/source/bio/index.md"
tutorialsarray=`ls $tutorialfolder`

cat <<EOF >>$indexfile
# Bioinformatics

This document provides a comprehensive list of tutorials and workshops related to bioinformatics offered at Tufts as well as installed bioinformatics applications at Tufts HPC. These resources are designed to enhance your understanding and skills in various bioinformatics applications. 

EOF

## Update tutorials
sed -i '/## Bioinformatics tutorials/,$d' $indexfile
echo "## Bioinformatics tutorials" >> $indexfile
echo "" >> $indexfile

for eachfile in $tutorialsarray
do
  title=`echo $eachfile | cut -d . -f 1 |sed 's/_/ /g'`
  echo "  - [$title](tutorials/$eachfile)"  >> $indexfile
done
echo "" >> $indexfile

## Update workshops

sed -i '/## Bioinformatics workshops/,$d' $indexfile
cat <<EOF >> $indexfile
## Bioinformatics workshops

  - [Datalab bioinformatics workshop 2024](https://tuftsdatalab.github.io/tuftsWorkshops/2024_workshops/readme/)
  - [TTS bioinformatics resources](https://it.tufts.edu/bioinformatics)
  - [Tufts Research Technology Bioinformatics Workshops Series](https://tuftsdatalab.github.io/Research_Technology_Bioinformatics/)
  - [BEST group bioinformatics workshops](https://best-tufts.github.io/bioinformatics_workshops/)
  - [Introduction to Next Generation Sequencing Bioinformatics](https://tuftsdatalab.github.io/intro-to-ngs-bioinformatics/)
  - [Introduction to RNA-seq with Galaxy](https://tuftsdatalab.github.io/intro-to-rnaseq-with-galaxy/)
  - [Running RNA-Seq analysis with nextflow & nf-core](https://tuftsdatalab.github.io/tuftsWorkshops/2024_workshops/nfcore_rnaseq_sp24/00_introduction/)

EOF

## Update applications
sourcefolder="$repo_path/source/bio/apps/"

filenamesarray=`ls $sourcefolder`

sed -i '/## Bioinformatics applications/,$d' $indexfile
echo "## Bioinformatics applications" >> $indexfile
echo "" >> $indexfile
for eachfile in $filenamesarray
do
   echo "  - [$eachfile](apps/$eachfile/$eachfile.rst)" >> $indexfile
done
