# trinotate

Scripts for trinotate

## 1. TransDecoder.LongOrfs

Open TransDecoder.md and run the part for TransDecoder.LongOrfs

## 2. blastx_batch_creation.sh and blastp_batch_creation.sh

  > for i in {0..X}; do sh blastx_batch_creation.sh $ACCOUNT $INPUT_DIR batch_prefix_$i $DB $i > scripts/blastx_$i ; sh blastp_batch_creation.sh $ACCOUNT $INPUT_DIR batch_prefix_$i $DB $i > scripts/blastp_$i ; done

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
  
### After all blastp and blastx scripts have finished, do:

> for i in {0..X}; do cat blastp_transdecoder.outfmt6_$i >> concatenated_blastp.outfmt6; cat blastx_transdecoder.outfmt6_$i >> concatenated_blastx.outfmt6; done

## 3. hmm_batch_creation.sh

 > for i in {0..X}; do sh hmm_batch_creation.sh $ACCOUNT $INPUT_DIR $i batch_prefix_$i > scripts/hmm_$i ; done
 
Where:
 - X = number of batch files created by split_fasta.py
 - $ACCOUNT is the name of the account you use to run the jobs. Normally "def-something"
 - $INPUT_DIR is the directory where you saved the batch files created by split_fasta.py
 - batch_prefix is the name you gave to the batch files created by split_fasta.py with longest_orfs.pep

### After all hmmscan scripts have finished, do

> for i in {0..X}; do cat TrinotatePFAM.out_$i >> TrinotatePFAM.out; cat HMM_pfam.out_$i >> HMM__pfam.out; done

## 4. TransDecoder.Predict

Open TransDecoder.md and run the part for TransDecoder.Predict

## 5. rnammer_creation.sh

 > sh rnammer_creation.sh $ACCOUNT $INPUT_DIR $TRINOTATE_DIR $TRINITY.FASTA $PATH_RNAMMER > scripts/run_rnammer.sh
 
Where:
 - $ACCOUNT is the name of the account you use to run the jobs. Normally "def-something"
 - $INPUT_DIR is the directory where you have the output of the assembly
 - $TRINOTATE_DIR is the directory of the trinotate you are using
 - $TRINITY.FASTA is the output of the assembly
 - $PATH_RNAMMER is the path to the rnammer you are using
 
 ## 6. signalp_creation.sh

 > sh signalp_creation.sh $ACCOUNT $INPUT_DIR $SIGNALP $PEP > scripts/run_signalp.sh
 
Where:
 - $ACCOUNT is the name of the account you use to run the jobs. Normally "def-something"
 - $INPUT_DIR is the directory where you have the output of the assembly
 - $SIGNALP is the path to the signalp you are using
 - $PEP is the TransDecoder.LongOrfs output (longest_orfs.pep)
 
 ## 7. tmhmm_creation

 > for i in {0..X}; do sh tmhmm_creation.sh $ACCOUNT $INPUT_DIR batch_prefix_$i $i > scripts/tmhmm_$i ; done
 
Where:
 - X = number of batch files created by split_fasta.py
 - $ACCOUNT is the name of the account you use to run the jobs. Normally "def-something"
 - $INPUT_DIR is the directory where you saved the batch files created by split_fasta.py
 - batch_prefix is the name you gave to the batch files created by split_fasta.py with longest_orfs.pep

### After all tmhmm scripts have finished, do

> for i in {0..X}; do cat tmhmm.out_$i >> tmhmm.out; done
