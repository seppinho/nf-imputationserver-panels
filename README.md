# imputation-panels
This repository includes a Nextflow pipeline to shuffle reference panels and compress it as msav files for Minimac4.

## Getting started
* Install [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html#installation) (>=22.10.4)
* Build docker iamge and run a static test
```
docker build -t seppinho/imputation-panels .
nextflow run main.nf -c tests/test_three_vcfs.config -profile docker
```
