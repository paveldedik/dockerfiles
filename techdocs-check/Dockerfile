FROM python:3.10-alpine

ENV version=1.1

# Metadata
LABEL name=techdocs-check version=$version \
    maintainer="Pavel Dedik <dedikx@gmail.com>"

RUN apk add --no-cache bash && \
    pip install --no-cache mkdocs-techdocs-core==1.*

WORKDIR /app

COPY mkdocs-check.sh /bin/mkdocs-check

USER nobody

CMD ["mkdocs-check"]
