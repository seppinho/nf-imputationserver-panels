process CREATE_SITES {
    
    publishDir params.output + '/sites', mode: 'copy'
    
    input:
    path(input)

    output:
    path("*.sites.*"), emit: sites_ch
    
    script:
    def input_name = "$input".endsWith("vcf.gz") ? "$input".replaceAll('.vcf.gz', '') : "$input.baseName"
    """
    echo -e "ID\tCHROM\tPOS\tREF\tALT\tAAF_ALL" > header
    bcftools +fill-tags "$input" -- -t AF | \\
        bcftools query -f '%CHROM:%POS:%REF:%FIRST_ALT\t%CHROM\t%POS\t%REF\t%FIRST_ALT\t%AF\n' \
        | cat header - \
        | bgzip > "${input_name}".sites.gz
    tabix  -f  -s 2 -b 3 -e 3 -S 1 "${input_name}".sites.gz
    """
}
