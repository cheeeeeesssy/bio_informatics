#!/bin/bash

#SBATCH --job-name=fastp_wgs  	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb             	# Job memory request
#SBATCH --time=1:55:00       	# Time limit hrs:min:sec
#SBATCH --output=./trimmed/fastp_slurm.log  # Standard output and error log
#SBATCH --partition=short

cd ./trimmed
process_sample() {
    R1=$1
    R2=${R1/_1.fq.gz/_2.fq.gz}
    BASE=$(basename "$R1")    
    fastp -w 20 -i "$R1" -I "$R2" -o "fastp_output/$BASE" -O "fastp_output/${BASE/_1.fq.gz/_2.fq.gz}" \
        --unpaired1 "fastp_output/${BASE/_1.fq.gz/_U.fq.gz}" --unpaired2 "fastp_output/${BASE/_1.fq.gz/_U.fq.gz}" \
        --adapter_fasta adapters.fa -5 -r -f 15 -M 25
}
export -f process_sample
find /projects/mipt_dbmp_biotechnology/genomics/raw -name "*_1.fq.gz" | \
    parallel -j 2 --eta process_sample