#!/bin/bash
#SBATCH --job-name=trimmomatic_trim
#SBATCH --output=trimmomatic_%j.out
#SBATCH --error=trimmomatic_%j.err
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G

trimmomatic PE -threads 4 \
  /projects/mipt_dbmp_biotechnology/genome/illumina_reads_R1_001.fastq \
  /projects/mipt_dbmp_biotechnology/genome/illumina_reads_R2_001.fastq \
  trimmed_R1_paired.fastq.gz trimmed_R1_unpaired.fastq.gz \
  trimmed_R2_paired.fastq.gz trimmed_R2_unpaired.fastq.gz \
  ILLUMINACLIP:/projects/mipt_dbmp_biotechnology/genome/adapters.fa:2:30:10 \
  LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 MINLEN:36

