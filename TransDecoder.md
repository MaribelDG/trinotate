If in a cluster, do this:

> module load nixpgs/16.09 gcc/7.3.0 transdecoder # It may fail if nixpkgs and gcc are not the requirements on your cluster

If you are running this in your computer directly, forget the previous step and do this:

> TRANSDECODER=path/to/transdecoder # Then run transdecoder as $TRANSDECODER/TransDecoder.LongOrfs or $TRANSDECODER/TransDecoder.Predict

> **TransDecoder.LongOrfs -t Trinity.fasta** # Replace Trinity.fasta for the output of the assembly, if you changed its name.

Further analyses take too long to run on the command line, so you can submit a job to the queue.
If it still takes to long, than you can run split_fasta.py on the Trinity.fasta and longest_orfs.pep, annotate the partial files and concatenate them.

Now, for TransDecoder.Predict:

> **TransDecoder.Predict -t Trinity.fasta --retain_pfam_hits TrinotatePFAM.out --retain_blastp_hits concatenated_blastp.outfmt6** # Replace Trinity.fasta for the output of the assembly, if you changed its name.
