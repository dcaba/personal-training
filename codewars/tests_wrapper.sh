#!/bin/bash

file_to_test=$1

name=$(echo $1 | cut -d "." -f 1)
test_file="tests/${name}_tests.rb"

docker run --rm codewars/codewars-runner run -l ruby -c "$(< $file_to_test)" -f "$(< $test_file)"
