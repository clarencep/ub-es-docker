FROM ubuntu:16.04

COPY . /data

RUN sh -xe /data/install

CMD [ "/run-in-docker" ]

