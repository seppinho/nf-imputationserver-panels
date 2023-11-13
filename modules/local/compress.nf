process COMPRESS {
    
    publishDir params.output, mode: 'copy'
    
    input:
    path(input)

    output:
    path("*.msav")
    
    script:
    def input_name = "$input".endsWith("vcf.gz") ? "$input".replaceAll('.vcf.gz', '') : "$input.baseName"
     """
    minimac4 --compress-reference ${input} > ${input_name}.msav
    rm ${input}
    """

}
