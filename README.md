# dockerfiles

Inspired by https://github.com/kiwicom/dockerfiles/

## paveldedik/k8s-tools

Contains helm, kubectl and vault.

## paveldedik/techdocs-check

Runs mkdocs recursively on found `mkdocs.yaml` files.

Running with docker:

```bash
docker run --rm -it -v $PWD:/app/ paveldedik/techdocs-check:latest
```
