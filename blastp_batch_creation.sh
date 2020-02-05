echo "#!/bin/sh
#SBATCH --account=$1
#SBATCH --job-name=blastp_$5
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=32000M

module purge
module load nixpkgs/16.09 gcc/7.3.0
module load blast+

echo 'Starting blastp'
cd $2
blastp -query $3\
 -db $4
 -evalue 1e-3\
 -task blastp\
 -num_threads 4\
 -outfmt 6\
 > blastp_transdecoder.outfmt6_$5

echo 'Finished blastp' "
