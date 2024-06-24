#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { CRAM2BAM } from './modules/local/cram2bam.nf'

cram = Channel.fromPath( params.cram ).first()

workflow {
    CRAM2BAM(cram)
}
