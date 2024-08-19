process CRAM2BAM {
    container 'quay.io/biocontainers/samtools:1.19.2--h50ea8bc_0'

    input:
    path cram_file
    path fasta
    path fai

    output:
    path bam_file
    path bam_index

    script:
    bam_file = cram_file.baseName + ".bam"
    bam_index = bam_file + ".bai"
    """
    # Convert CRAM to BAM
    samtools view -mm -m 100G -@ 30 -l 1 -b -o $bam_file $cram_file
    
    # Index the BAM file
    samtools index -@ 30 $bam_file
    """
}
