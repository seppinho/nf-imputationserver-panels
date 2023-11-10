process SHUFFLE_COMPRESS {
    
    publishDir params.output, mode: 'copy'
    
    input:
    path(input)

    output:
    path("*.msav")
    
    script:
    def seed = ImputationPanelsUtil.getSeed()
    def input_name = "$input".replaceAll('.vcf.gz', '')
    """
    
    rand-recom $input --seed $seed --uniform --target-length ${params.target_length} -O vcf.gz -o ${input_name}_recom.vcf.gz
    rm $input
    minimac4 --compress-reference ${input_name}_recom.vcf.gz > ${input_name}.msav
    rm ${input_name}_recom.vcf.gz
    """

}
