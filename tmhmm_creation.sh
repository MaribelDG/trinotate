echo "#!/bin/sh
#SBATCH --account=def-germain1
#SBATCH --job-name=tmhmm
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=32000M

module purge
module load nixpkgs/16.09 gcc/7.3.0
module load tmhmm

cd /home/karencgs/scratch/INRA/assembly_larch/trinity_larch/Larch_annotation/trinotate/batch_cds
echo 'Starting TMHMM'
tmhmm --short < $1 > /scratch/karencgs/INRA/assembly_larch/trinity_larch/Larch_annotation/trinotate/tmhmm.out_$2
echo 'Finished TMHMM'"
