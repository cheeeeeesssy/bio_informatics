#!/bin/bash
#SBATCH --job-name=fastqc_runner
#SBATCH --output=fastqc_output.log
#SBATCH --error=fastqc_error.log
#SBATCH --cpus-per-task=4
#SBATCH --time=02:00:00
#SBATCH --mem=8G

mkdir -p fastqc_results
fastqc ./srr_files/*.fastq.gz -o fastqc_results -t 4
multiqc fastqc_results -o fastqc_results

