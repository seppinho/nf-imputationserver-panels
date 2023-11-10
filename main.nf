#!/usr/bin/env nextflow
/*
========================================================================================
    genepi/nf-imputationserver-refpanels
========================================================================================
    Github : https://github.com/genepi/nf-imputationserver-refpanels
    Author: Sebastian Schönherr / Lukas Forer
    ---------------------------
*/

nextflow.enable.dsl = 2


include { IMPUTATION_PANELS } from './workflows/imputation_panels'

workflow {
    IMPUTATION_PANELS ()
}

