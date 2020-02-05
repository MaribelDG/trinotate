echo "#!/bin/sh
#SBATCH --account=$1
#SBATCH --job-name=signalp
#SBATCH --time=4:00:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --mem=128000M

module purge
module load nixpkgs/16.09 gcc/7.3.0

echo 'Starting SignalP'
cd $2
$3\ 
 -m signalp.fasta\
 -n signalp.gff\
 $4

echo 'Finish SignalP' "
