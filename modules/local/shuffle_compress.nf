process SHUFFLE_COMPRESS {
    
    publishDir params.output, mode: 'copy'
    
    input:
    path(input)

    output:
    path("*.msav")
    
    script:
    def seed = ImputationPanelsUtil.getSeed()
    def input_name = "$input".endsWith("vcf.gz") ? "$input".replaceAll('.vcf.gz', '') : "$input.baseName"
     """
    echo $input_name   
    rand-recom $input --seed $seed --uniform --target-length ${params.target_length} -O ${params.recom_format_out} -o ${input_name}_recom.${params.recom_format_out}
    rm $input
    minimac4 --compress-reference ${input_name}_recom.${params.recom_format_out} > ${input_name}.msav
    rm ${input_name}_recom.${params.recom_format_out}
    """

}
