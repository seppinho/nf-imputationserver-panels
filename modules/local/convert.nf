process CONVERT {
    
    publishDir params.output + '/msavs', mode: 'copy'
    
    input:
    path(input)

    output:
    path("*.msav")
    
    script:
    def input_name = "$input".replaceAll('.m3vcf.gz', '')
    
    """
    minimac4 --update-m3vcf ${input} > ${input_name}.msav
    rm ${input}
    """

}
