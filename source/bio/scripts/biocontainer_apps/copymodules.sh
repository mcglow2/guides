#!/bin/bash
current_dir="$PWD" # save current directory 
cd ../../ # go up two directories
repo_path="$PWD" # assign path to repo_path
cd $current_dir # cd back to current directory

biocontainers="$repo_path/module_files/"
gitfolders="$repo_path/docs/source/"

modulefolder="/cluster/tufts/biocontainers/modules/"
for app in $modulefolder*; do mkdir -p $repo_path/module_files/$(basename $app); done
cd $modulefolder
for module in **/*;do app=$(echo $module | cut -d '/' -f 1 );cp $HOME/svn/tufts_HPC/luas/${module}.lua $repo_path/module_files/$app/; done
