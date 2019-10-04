# FROM mongo:4.0.0
FROM google/cloud-sdk

RUN apt-get update && apt-get install -y mongo-tools

ENV WORKDIR=/home/dumper

WORKDIR ${WORKDIR}

COPY ./mongobackup.sh ${WORKDIR}

ENTRYPOINT ${WORKDIR}/mongobackup.sh