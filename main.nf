#!/usr/bin/env nextflow
/*
========================================================================================
    genepi/nf-imputationserver-refpanels
========================================================================================
    Github : https://github.com/genepi/nf-imputationserver-panels
    Author: Sebastian Schönherr / Lukas Forer
    ---------------------------
*/

nextflow.enable.dsl = 2


include { NF_IMPUTATIONSERVER_PANELS } from './workflows/nf_imputationserver_panels'

workflow {
    NF_IMPUTATIONSERVER_PANELS ()
}

