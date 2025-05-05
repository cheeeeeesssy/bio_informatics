#!/bin/sh

#SBATCH --job-name=gatk     	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb            	# Job memory request
#SBATCH --time=24:00:00       	# Time limit hrs:min:sec
#SBATCH --output=./variant_calling/gatk_slurm.log  # Standard output and error log
#SBATCH --partition=long

cd ./variant_calling;
gatk HaplotypeCaller -I ../sam/tagged.bam -R /projects/mipt_dbmp_biotechnology/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa -O variants.vcf
