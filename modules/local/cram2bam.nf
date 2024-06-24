process CRAM2BAM {
    container 'quay.io/biocontainers/samtools:1.19.2--h50ea8bc_0'

    input:
    path cram_file

    output:
    path bam_file

    script:
    bam_file = cram_file.baseName + ".bam"
    """
    samtools view -b -o $bam_file $cram_file
    """
}