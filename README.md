# imputation-panels
This repository includes a Nextflow pipeline to shuffle reference panels and compress it as msav files for Minimac4.

## Getting started
```
git clone https://github.com/seppinho/imputation-panels
docker build -t genepi/imputation-panels .
nextflow run main.nf -c tests/test_three_vcfs.config -profile development
```
## Profiles
We also provide profiles for `docker`, `singularity` and `slurm` in case you don't want to build the image locally. 
nextflow run main.nf -c tests/test_three_vcfs.config -profile docker

## Sample Config
```
params {
    project = "three_vcfs"
    files   = "tests/input/three/*.vcf.gz"
    target_length = 20000000
}
Final msav data is written to output/${params.project}
```
