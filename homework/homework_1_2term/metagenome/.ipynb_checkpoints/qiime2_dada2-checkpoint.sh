#!/bin/sh

#SBATCH --job-name=qiime2_dada        # Job name
#SBATCH --cpus-per-task=20         # Run on 20 CPU
#SBATCH --mem=20gb                 # Job memory request
#SBATCH --time=01:00:00           # Time limit hrs:min:sec
#SBATCH --output=JobName.%j.log   # Standard output and error log

qiime dada2 denoise-single \
    --i-demultiplexed-seqs qza/soil_reads.qza \
    --p-trim-left 25 \
    --p-trunc-len 200 \
    --p-max-ee 3 \
    --p-n-threads 20 \
    --p-pooling-method "pseudo" \
    --p-chimera-method "consensus" \
    --p-min-fold-parent-over-abundance 4 \
    --o-table qza/soil_ASV_table.qza \
    --o-representative-sequences qza/soil_rep_seq.qza \
    --o-denoising-stats qza/soil_reads.dada2.stats.qza
