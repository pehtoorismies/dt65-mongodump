# FROM mongo:4.0.0
FROM google/cloud-sdk

RUN apt-get update && apt-get install -y mongo-tools
# RUN apt-get update 
# RUN apt-get install -y curl
# RUN apt-get install -y python

# # Downloading gcloud package
# RUN curl -sSL https://sdk.cloud.google.com | bash

# ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

ENV WORKDIR=/home/dumper

WORKDIR ${WORKDIR}

COPY ./mongobackup.sh ${WORKDIR}

ENTRYPOINT ${WORKDIR}/mongobackup.sh