#!/bin/bash

working_dir="$PWD"

for mkdocs in $(find . -name mkdocs.yaml 2>/dev/null); do
  docsdir=$(dirname $mkdocs)
  echo "running command 'mkdocs build $docsdir' ..."

  cd $(dirname $mkdocs)

  output=$(mkdocs build -d /tmp/$docsdir 2>&1)
  errors=$(echo "$output" | grep ERROR)

  if [ -z "$errors" ]; then
    warnings=$(echo "$output" | grep WARNING)

    if [ -z "$warnings" ]; then
        echo "build suceeded"
    else
        echo "build failed returning the following WARNINGS:"
        echo ""
        echo "$warnings"
        exit 1
    fi

  else
    echo "build failed returning the following ERRORS:"
    echo ""
    echo "$errors"
    exit 1
  fi

  echo ""
  cd $working_dir

done
