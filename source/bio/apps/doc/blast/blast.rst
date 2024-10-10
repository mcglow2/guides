.. _backbone-label:

Blast
==============================

Introduction
~~~~~~~~
BLAST (Basic Local Alignment Search Tool) finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance.

Versions
~~~~~~~~
- 2.15.0

Commands
~~~~~~~
- amino-acid-composition
- between-two-genes
- blastdb_aliastool
- blastdbcheck
- blastdbcmd
- blast_formatter
- blastn
- blastp
- blastx
- cleanup-blastdb-volumes.py
- deltablast
- dustmasker
- eaddress
- eblast
- get_species_taxids.sh
- legacy_blast.pl
- makeblastdb
- makembindex
- makeprofiledb
- psiblast
- rpsblast
- rpstblastn
- run-ncbi-converter
- segmasker
- tblastn
- tblastx
- update_blastdb.pl
- windowmasker

Example job
~~~~~
Adjust slurm options based on job requirements (`slurm cheat sheet <https://slurm.schedmd.com/pdfs/summary.pdf>`_)::

 #!/bin/bash
 #SBATCH -p partitionName  # batch, gpu, preempt, mpi or your group's own partition
 #SBATCH -t 1:00:00  # Runtime limit (D-HH:MM:SS)
 #SBATCH -N 1	# Number of nodes
 #SBATCH -n 1	# Number of tasks per node 
 #SBATCH -c 4	# Number of CPU cores per task
 #SBATCH --mem=8G	# Memory required per node
 #SBATCH --job-name=blast	# Job name
 #SBATCH --mail-type=FAIL,BEGIN,END	# Send an email when job fails, begins, and finishes
 #SBATCH --mail-user=your.email@tufts.edu	# Email address for notifications
 #SBATCH --error=%x-%J-%u.err	# Standard error file: <job_name>-<job_id>-<username>.err
 #SBATCH --output=%x-%J-%u.out	# Standard output file: <job_name>-<job_id>-<username>.out

 module purge	### Optional, but highly recommended.
 module load blast/XXXX	### Latest version is recommended. 
