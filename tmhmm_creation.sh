echo "#!/bin/sh
#SBATCH --account=$1
#SBATCH --job-name=tmhmm
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=32000M

module purge
module load nixpkgs/16.09 gcc/7.3.0
module load tmhmm

cd $2
echo 'Starting TMHMM'
tmhmm --short < $3 > tmhmm.out_$4
echo 'Finished TMHMM'"
