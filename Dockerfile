FROM ubuntu:18.04
LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)" \
      version.homer="4.11" \
      source.homer="http://homer.ucsd.edu/homer/download.html"

ENV HOMER_VERSION=4.11

RUN apt-get update -y \
    && apt-get install -y build-essential wget curl zip

RUN cd /tmp \
    && curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda \
    && rm -rf /tmp/Miniconda3-latest-Linux-x86_64.sh \
    && . /opt/conda/etc/profile.d/conda.sh \
    && conda init \
    && conda update -n base -c defaults conda \
    && conda config --add channels bioconda \
    && conda config --add channels conda-forge

RUN . /opt/conda/etc/profile.d/conda.sh \
    && conda install -y samtools \
    && conda install -y r-essentials \
    && conda install -y bioconductor-deseq2 \
    && conda install -y bioconductor-edger

RUN mkdir /opt/homer && cd /opt/homer \
    && wget http://homer.ucsd.edu/homer/configureHomer.pl \
    && perl configureHomer.pl -install homer

ENV PATH=$PATH:/opt/homer/bin/
