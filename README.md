# Slurm Script Arguments

Scripts for virtual environment creation are in this repository.

There are also scripts are used to launch training runs on a Slurm-managed cluster. It takes several arguments to configure the training process.

NOTE: there are several placholders throughout the run scripts that should be replaced appropriately.

## Arguments:

* `G_INTRA_R=$1`:  The G_x part of the config.
* `G_INTRA_C=$2`:  The G_y part of the config.
* `G_INTRA_D=$3`:  The G_z part of the config.
* `TRIAL_NUM=$4`:  Trial number used in the output filename.
* `TRAIN_FILE=$5`:  Path to train.py file (e.g., from Plexus repository's examples directory).
* `DATA_DIR=$6`:  Path to directory containing the preprocessed data (unpartitioned or partitioned).
* `RESULT_DIR=$7`:  Directory to save output file to.

## Perlmutter Specifics (ogbn-papers100M):

For running ogbn-papers100M on 64 and 128 GPUs on Perlmutter, request the 80GB GPU nodes:

#SBATCH -C gpu&hbm80g

## GPU OOM Issues:

For GPU OOM issues (fragmentation warnings from PyTorch), try:

export PYTORCH_CUDA_ALLOC_CONF="expandable_segments:True"

