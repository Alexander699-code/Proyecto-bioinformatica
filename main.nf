
process indexGenome {
  input:
    path fasta
  output:
    path "${fasta}.fai"
  script:
    """
    samtools faidx $fasta
    """
}

workflow {
  Channel.fromPath('data/ecoli/*.fna') | indexGenome
}
