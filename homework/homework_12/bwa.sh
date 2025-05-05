#!/bin/sh

#SBATCH --job-name=bwa_wgs     	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb            	# Job memory request
#SBATCH --time=24:00:00      	# Time limit hrs:min:sec
#SBATCH --output=./align/bwa_slurm.log  # Standard output and error log
#SBATCH --partition=long

cd ./align;
bwa mem -t 40 /projects/mipt_dbmp_biotechnology/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa /home/vpiskaeva/homework/homework_12/trimmed/WGSB_46_01_PTV291209_325278_1.fastq.gz /home/vpiskaeva/homework/homework_12/trimmed/WGSB_46_01_PTV291209_325278_2.fastq.gz | gzip -3 > aln_pe.sam.gz
