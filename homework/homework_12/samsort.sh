#!/bin/sh

#SBATCH --job-name=sam_sort     	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb            	# Job memory request
#SBATCH --time=1:55:00       	# Time limit hrs:min:sec
#SBATCH --output=./sam/sam_slurm.log  # Standard output and error log
#SBATCH --partition=short

module load samtools
cd ./sam;
zcat ../align/aln_pe.sam.gz | samtools sort --threads 40 -o sorted.bam
