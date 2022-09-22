FROM node:18-alpine

ENV version=1.0

# Metadata
LABEL name=techdocs-check version=$version \
    maintainer="Pavel Dedik <dedikx@gmail.com>"

RUN apk add --no-cache bash py3-pip && \
    pip install --no-cache mkdocs-techdocs-core==1.* && \
    pip install --no-cache shyaml && \
    npm install -g @techdocs/cli

WORKDIR /app

COPY mkdocs-check.sh /bin/mkdocs-check
COPY techdocs-publish.sh /bin/techdocs-publish
COPY techdocs.sh /bin/techdocs

USER nobody

ENTRYPOINT ["techdocs"]
