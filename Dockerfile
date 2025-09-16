FROM ubuntu:22.04

# Install compilers
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    libncurses5-dev \
    libbz2-dev \
    liblzma-dev \
    zlib1g-dev \
    libgsl-dev \
    libcurl4-openssl-dev \
    ca-certificates \
    unzip \
    && rm -rf /var/lib/apt/lists/*

#  Install miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py39_24.7.1-0-Linux-x86_64.sh -O ~/miniconda.sh && \
  /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=/opt/conda/bin:${PATH}

COPY environment.yml .
RUN conda update -y conda && \
    conda env update -n root -f environment.yml && \
    conda clean --all

WORKDIR "/opt"
# Set bcftools version
ARG BCFTOOLS_VERSION=1.22
# Download and compile bcftools from source
RUN wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 && \
    tar -xjf bcftools-${BCFTOOLS_VERSION}.tar.bz2 && \
    cd bcftools-${BCFTOOLS_VERSION} && \
    ./configure --prefix=/usr/local && \
    make && make install && \
    cd .. && \
    rm -rf bcftools-${BCFTOOLS_VERSION}* 

WORKDIR "/opt"
# Set bcftools version
ARG HTSLIB_VERSION=1.22
# Download and compile bcftools from source
RUN wget https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 && \
    tar -xjf htslib-${HTSLIB_VERSION}.tar.bz2 && \
    cd htslib-${HTSLIB_VERSION} && \
    ./configure --prefix=/usr/local && \
    make && make install && \
    cd .. && \
    rm -rf htslib-${HTSLIB_VERSION}*   

# Install minimac4
WORKDIR "/opt"
RUN mkdir minimac4
COPY files/bin/minimac4 minimac4/.
ENV PATH="/opt/minimac4:${PATH}"
RUN chmod +x /opt/minimac4/minimac4

# Install recombination tool
WORKDIR "/opt"
RUN mkdir rand-recom
COPY files/bin/rand-recom rand-recom/.
ENV PATH="/opt/rand-recom:${PATH}"
RUN chmod +x /opt/rand-recom/rand-recom
