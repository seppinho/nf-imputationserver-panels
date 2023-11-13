requiredParams = [
    'project', 'files'
]

for (param in requiredParams) {
    if (params[param] == null) {
      exit 1, "Parameter ${param} is required."
    }
}

params.output = "output/${params.project}"

include { SHUFFLE  } from '../modules/local/shuffle'
include { COMPRESS } from '../modules/local/compress'

workflow IMPUTATION_PANELS {

    files = Channel
        .fromPath(params.files)

    if(params.target_length != 0) {

        SHUFFLE ( 
            files
        )
        files = SHUFFLE.out.recom_ch
    
    }

    COMPRESS ( 
        files
    )

}


