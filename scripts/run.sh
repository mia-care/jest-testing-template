#!/bin/sh

if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

npm test

# Check if the test results file exists
if [ -f ./test-results/junit.xml ]; then
  # Send the junit.xml file to the callback endpoint
  curl -X POST ${P4SAMD_BACKEND_HOST}/tests-results/callback/${JOB_NAME} -H "Content-Type: application/xml" --data-binary "@./test-results/junit.xml" -H "secret:${P4SAMD_API_KEY}"
else
  echo "Test results file not found!"
fi
