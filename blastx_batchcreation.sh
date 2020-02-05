echo "#!/bin/sh
#SBATCH --account=def-germain1
#SBATCH --job-name=blast
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=32000M

module purge
module load nixpkgs/16.09 gcc/7.3.0
module load blast+

echo 'Starting blastx'
cd /scratch/karencgs/INRA/assembly_larch/trinity_larch/Larch_annotation/trinotate/batch_cds/
blastx -query $1\
 -db /cvmfs/soft.mugqic/CentOS6/genomes/blast_db/uniprot_sprot.trinotate_v2.0.pep\
 -evalue 1e-5\
 -task blastx\
 -num_threads 16\
 -outfmt 6\
 > blastx_transdecoder.outfmt6_$2

echo 'Finished blastx' "
~
