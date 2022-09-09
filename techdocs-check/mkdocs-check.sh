#!/bin/bash

working_dir="$PWD"

for mkdocs in $(find . -name mkdocs.yaml 2>/dev/null); do
  docs_dir=$(dirname $mkdocs)
  echo "running command 'mkdocs build $docs_dir' ..."

  if [ $docs_dir = "." ]; then
    build_dir="/tmp/root"
  else
    build_dir="/tmp/$docs_dir"
  fi

  cd $docs_dir

  output=$(mkdocs build -d $build_dir 2>&1)
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
