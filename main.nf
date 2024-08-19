#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { CRAM2BAM } from './modules/local/cram2bam.nf'

cram  = Channel.fromPath( params.cram ).first()
fasta = Channel.fromPath( params.fasta ).first()
fai   = Channel.fromPath( "${params.fasta}.fai" ).first()

workflow {
    CRAM2BAM(cram, fasta, fai)
}
