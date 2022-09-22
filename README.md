# dockerfiles

Inspired by https://github.com/kiwicom/dockerfiles/

## paveldedik/k8s-tools

Contains helm, kubectl and vault.

## paveldedik/techdocs

There are two arguments:

### `check`

Runs `mkdocs` recursively on found `mkdocs.yaml` files.

Running with docker:

```bash
docker run --rm -it -v $PWD:/app/ paveldedik/techdocs:latest check
```

### `publish`

Runs `techdocs-cli publish` recursively in folders with `mkdocs.yaml` files.

You need to pass the following environment variables to this job:

```yaml
TECHDOCS_PUBLISHER_TYPE=awsS3
TECHDOCS_S3_BUCKET_NAME=bucket-name

# variables for awsS3 publisher type
AWS_ACCESS_KEY_ID=id
AWS_SECRET_ACCESS_KEY=access-key
AWS_REGION=region
```

Running with docker:

```bash
docker run --rm -it -v $PWD:/app/ -e ... paveldedik/techdocs:latest publish
```
