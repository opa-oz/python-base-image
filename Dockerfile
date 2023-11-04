ARG FROM_IMAGE=python
ARG FROM_TAG=3.12

FROM ${FROM_IMAGE}:${FROM_TAG}-alpine

RUN apk update
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache wget curl
RUN apk add --no-cache git