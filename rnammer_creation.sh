echo "#!/bin/sh
#SBATCH --account=$1
#SBATCH --job-name=rnammer
#SBATCH --time=4:00:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --mem=128000M

module purge
module load nixpkgs/16.09 gcc/5.4.0 intel/2016.4

echo 'Starting RNAmmer'

cd $2
$3/util/rnammer_support/RnammerTranscriptome.pl\
 --transcriptome $4\
 --path_to_rnammer\
 $5

echo 'Finished RNAmmer' "
