# trinotate
Scripts for trinotate

To run blastx_batch_creation.sh and blastp_batch_creation.sh, do:

  > for i in {0..X}; do blastx_batch_creation.sh $ACCOUNT $INPUT_DIR batch_prefix_$i $DB $i > scripts/blastx_$i ; done
  
  > for i in {0..X}; do blastp_batch_creation.sh $ACCOUNT $INPUT_DIR batch_prefix_$i $DB $i > scripts/blastp_$i ; done

Where:
 - X = number of batch files created by split_fasta.py
 - $ACCOUNT is the name of the account you use to run the jobs. Normally "def-something"
 - $INPUT_DIR is the directory where you saved the batch files created by split_fasta.py
 - batch_prefix is the name you gave to the batch files created by split_fasta.py
 - $DB is the complete path to the database (uniprot_sprot)
 
If you do not have a "scripts" folder, run "mkdir scripts" before.

### Note: for blastx, you use the output of the assembly (Trinity.fasta, or the partial files you created using split_fasta.py and Trinity.fasta), for blastp you use the output of TransDecoder.LongOrfs (longest_orfs.pep, or the partial files you created using split_fasta.py and longest_orfs.pep)
 
