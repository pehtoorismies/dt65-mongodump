FROM mongo:4.0.0

ENV WORKDIR=/home/dumper

WORKDIR ${WORKDIR}

COPY ./mongobackup.sh ${WORKDIR}

ENTRYPOINT ${WORKDIR}/mongobackup.sh