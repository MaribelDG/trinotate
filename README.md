# trinotate
Scripts for trinotate

To run blastx_batch_creation.sh, do:

  > for i in {0..X}; do blastx_batch_creation.sh $ACCOUNT $INPUT_DIR batch_prefix_$i $DB $i > scripts/blastx_$i ; done

Where:
 - X = number of batch files created by split_fasta.py
 - $ACCOUNT is the name of the account you use to run the jobs. Normally "def-something"
 - $INPUT_DIR is the directory where you saved the batch files created by split_fasta.py
 - batch_prefix is the name you gave to the batch files created by split_fasta.py
 - $DB is the complete path to the database (uniprot_sprot)
 
 
If you do not have a "scripts" folder, run "mkdir scripts" before.
