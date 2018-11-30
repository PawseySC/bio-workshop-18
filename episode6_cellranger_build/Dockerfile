FROM centos:7

# Install package dependencies
RUN yum -y update \
    && yum -y install \
         file \
         git \
         sssd-client \
         which \
         wget \
         unzip \
    && yum clean all

# Install Cell Ranger
ARG CELLRANGER_VERSION="2.2.0"

WORKDIR /tmp/cellranger-build

RUN wget -O cellranger-${CELLRANGER_VERSION}.tar.gz \
      "http://cf.10xgenomics.com/releases/cell-exp/cellranger-${CELLRANGER_VERSION}.tar.gz?Expires=1536322784&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9jZWxsLWV4cC9jZWxscmFuZ2VyLTIuMi4wLnRhci5neiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTUzNjMyMjc4NH19fV19&Signature=Hh~r20eoRKmPPqVqPXnLeML01CiEThHjSvpmCMVUaJ9noid1kiE~d3QwcCfrEfEguXCuuVbePJBpRscV50pgdPat2MDoZDmU8Yjbp2ucgmttLUz7rVC~HhJ6rqKPDVfcADwt53Ia9WEtWTNZ7vS4JlsXtBTRR6iORSwcbVCqOjwD6SuAvaBn7W2GGx-FzylgZBe2WAK0fUMOFxtaMG~YVXmdKeuZf0qJJSrKvO0M7L9WdrmPYnfvr~a4JUvJZlZ7gX5rz9IOYW-MYRLs-A7fLfuGNOktz4HnrNv9Ecxa~dZ5Pn2YBF17N7ULCWHedpz1pXFPWjZxaVSHYd8L6cJDBw__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" \
    && mv cellranger-${CELLRANGER_VERSION}.tar.gz /opt/ \
    && cd /opt/ \
    && tar -xzvf cellranger-${CELLRANGER_VERSION}.tar.gz \
    && rm -f cellranger-${CELLRANGER_VERSION}.tar.gz \
    && rm -rf /tmp/cellranger-build

# Install bcl2fastq
ARG BCL_ZIP_VERSION="2-20-0"
ARG BCL_RPM_VERSION="2.20.0.422"

WORKDIR /tmp/bcl2fastq-build

RUN wget http://sapac.support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v${BCL_ZIP_VERSION}-linux-x86-64.zip \
    && unzip bcl2fastq2-v${BCL_ZIP_VERSION}-linux-x86-64.zip \
    && yum -y --nogpgcheck localinstall bcl2fastq2-v${BCL_RPM_VERSION}-Linux-x86_64.rpm \
    && rm -f bcl2fastq2-v${BCL_ZIP_VERSION}-linux.zip \
    && rm -rf /tmp/bcl2fastq-build

WORKDIR /

# Add cell ranger to path
ENV PATH /opt/cellranger-${CELLRANGER_VERSION}:$PATH
