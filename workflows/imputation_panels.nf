requiredParams = [
    'project', 'files'
]

for (param in requiredParams) {
    if (params[param] == null) {
      exit 1, "Parameter ${param} is required."
    }
}

params.output = "output/${params.project}"

include { SHUFFLE_COMPRESS } from '../modules/local/shuffle_compress'

workflow IMPUTATION_PANELS {

    Channel
    .fromPath(params.files)
    .set {files}

        SHUFFLE_COMPRESS ( 
        files
    )

}


