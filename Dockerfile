FROM alpine:latest

RUN apk update
RUN apk add ssmtp curl docker-cli docker-compose

WORKDIR /cron

COPY ./entrypoint.sh entrypoint.sh
COPY ./runner.sh runner.sh

ENTRYPOINT ./entrypoint.sh
