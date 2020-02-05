import sys

def split_fasta(filename, prefix_output, batch_size):
        """
                This function takes the full address of a fasta/q file (filename), \
                a prefix for the outputs and the desired number of sequences per file (batch size) \
                and separates the 'filename' into the necessary number of fasta files.

                Example:
                split_fasta('path/to/fasta.fasta', 'batch_file', 1000)
        """

        from Bio import SeqIO
        fasta = SeqIO.parse(open(filename), 'fasta')
        seqs = [i for i in fasta]
        groups = [[]]
        count = 0
        n = 0
        for i in seqs:
                if count == batch_size: n +=1; count = 0; groups.append([])
                groups[n].append(i)
                count += 1
        for i in range(len(groups)):
                name = prefix_output + '_' + str(i) + '.fasta'
                open(name, 'x')
                with(open(name, 'w')) as file:
                        for seq in groups[i]:
                                file.write('>' + str(seq.id) + '\n' + str(seq.seq) + '\n')
                        print('File of name %s writen with %d records' % (name, len(groups[i])))



split_fasta(sys.argv[1], sys.argv[2], sys.argv[3])
