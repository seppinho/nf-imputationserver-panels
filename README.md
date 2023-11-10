# imputation-panels
This repository includes a Nextflow pipeline to shuffle reference panels and compress it as msav files for Minimac4.

## Getting started
```
docker build -t seppinho/imputation-panels .
nextflow run main.nf -c tests/test_three_vcfs.config -profile development
```
