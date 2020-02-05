echo "#!/bin/sh
#SBATCH --account=$1
#SBATCH --job-name=hmm_$3
#SBATCH --time=3:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=48G

module load nixpkgs/16.09 gcc/7.3.0
module load hmmer

echo 'Starting HMMScan'
cd $2
hmmscan\
 --cpu 16\
 --domtblout TrinotatePFAM.out_$3\
 /cvmfs/soft.mugqic/CentOS6/genomes/pfam_db/Pfam-A.hmm\
 $4 \
> HMM_pfam.out_$3

echo 'Finish HMMScan'"
