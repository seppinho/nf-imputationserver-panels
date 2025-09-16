requiredParams = [
    'project', 'files'
]

for (param in requiredParams) {
    if (params[param] == null) {
      exit 1, "Parameter ${param} is required."
    }
}

params.output = "output/${params.project}"
include { CREATE_SITES  } from '../modules/local/create_sites'
include { SHUFFLE  } from '../modules/local/shuffle'
include { COMPRESS } from '../modules/local/compress'
include { CONVERT } from '../modules/local/convert'

workflow NF_IMPUTATIONSERVER_PANELS {

    files = Channel
        .fromPath(params.files)

    CREATE_SITES ( 
        files
    )
    
    if (params.mode == 'recom') {
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
    else if (params.mode == 'convert') {
        CONVERT ( 
            files
        )
    }
    else {
        println "No mode detected for creating MSAV files"
    }
}


