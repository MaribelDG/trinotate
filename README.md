# trinotate

Scripts for trinotate

## To run blastx_batch_creation.sh and blastp_batch_creation.sh, do:

  > for i in {0..X}; do blastx_batch_creation.sh $ACCOUNT $INPUT_DIR batch_prefix_$i $DB $i > scripts/blastx_$i ; blastp_batch_creation.sh $ACCOUNT $INPUT_DIR batch_prefix_$i $DB $i > scripts/blastp_$i ; done

Where:
 - X = number of batch files created by split_fasta.py
 - $ACCOUNT is the name of the account you use to run the jobs. Normally "def-something"
 - $INPUT_DIR is the directory where you saved the batch files created by split_fasta.py
 - batch_prefix is the name you gave to the batch files created by split_fasta.py
 - $DB is the complete path to the database (uniprot_sprot)
 
If you do not have a "scripts" folder, run "mkdir scripts" before.

### Note
  - For **blastx**, you use the output of the assembly (_Trinity.fasta_, or the partial files you created using split_fasta.py and Trinity.fasta)
  - For **blastp** you use the output of TransDecoder.LongOrfs (_longest_orfs.pep_, or the partial files you created using split_fasta.py and longest_orfs.pep)

## To run hmm_batch_creation.sh, do:

 > for i in {0..X}; do hmm_batch_creation.sh $ACCOUNT $INPUT_DIR $i batch_prefix_$i > scripts/blastx_$i ; done
 
Where:
 - X = number of batch files created by split_fasta.py
 - $ACCOUNT is the name of the account you use to run the jobs. Normally "def-something"
 - $INPUT_DIR is the directory where you saved the batch files created by split_fasta.py
 - batch_prefix is the name you gave to the batch files created by split_fasta.py
