echo "#!/bin/sh
#SBATCH --account=$1
#SBATCH --job-name=blastx_$5
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=32000M

module purge
module load nixpkgs/16.09 gcc/7.3.0
module load blast+

echo 'Starting blastx'
cd $2
blastx -query $3\
 -db $4\
 -evalue 1e-5\
 -task blastx\
 -num_threads 16\
 -outfmt 6\
 > blastx_transdecoder.outfmt6_$5

echo 'Finished blastx' "
