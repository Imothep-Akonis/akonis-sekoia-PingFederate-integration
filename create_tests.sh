#!/usr/bin/env bash

# List of keywords
KEYWORDS=(
  cookies
)

OUTPUT_DIR="tests"
echo "" > all_tests.py
# Iterate and create JSON files
for keyword in "${KEYWORDS[@]}"; do
  #filepath="${OUTPUT_DIR}/${keyword}.json"
  line=`grep ${keyword} pingfederate_sample.log | head -n 1`
  #echo "${keyword};${line}"
  echo "poetry run python3 create_test.py ../formats/pingfederate/tests/${keyword}.json \"${line//\"/\\\"}\"" >> all_tests.py
done
