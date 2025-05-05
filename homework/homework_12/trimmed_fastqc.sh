#!/bin/sh

#SBATCH --job-name=wgs_fastqc  	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb             	# Job memory request
#SBATCH --time=1:30:00       	# Time limit hrs:min:sec
#SBATCH --output=./trimmed/fastqc/fastqc_slurm.log  # Standard output and error log
#SBATCH --partition=short

cd ./trimmed/fastqc;
ls ~/homework/homework_12/trimmed/fastp_output/*.gz | parallel -j6 "fastqc -t 6 -o . {}"

