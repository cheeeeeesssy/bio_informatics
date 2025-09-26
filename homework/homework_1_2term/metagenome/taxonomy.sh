#!/bin/sh

#SBATCH --job-name=qiime2_taxonomy        # Job name
#SBATCH --cpus-per-task=20         # Run on 20 CPU
#SBATCH --mem=40gb                 # Job memory request
#SBATCH --time=01:00:00           # Time limit hrs:min:sec
#SBATCH --output=taxonomy.log   # Standard output and error log

qiime feature-classifier classify-sklearn \
    --i-classifier /projects/mipt_dbmp_biotechnology/metagenomes/soil/2022.10.backbone.v4.nb.sklearn-1.4.2.qza \
    --i-reads qza/soil_rep_seq.qza \
    --o-classification qza/soil_taxonomy.qza \
    --p-n-jobs 16

