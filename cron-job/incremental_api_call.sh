#!/bin/bash

# The directory where you want to store the logs
# TODO: Add Logic to remove unnecessay logs so the file size doesnt overload
# FIXME: how to consume env file in here
LOG_DIR="/var/log/ondc-protocol"

# Ensure the log directory exists
mkdir -p "$LOG_DIR"
chown -R mdeep "$LOG_DIR"
chmod -R 775 "$LOG_DIR"

# JSON payload
JSON_PAYLOAD='{"domains": ["ONDC:RET10"],"cities": ["std:011","std:080"]}'

# The API call with the API key, server address, and JSON payload
API_CALL=$(curl --request POST \
  --url "${PROTOCOL_URL}/protocol/cron/search/incremental" \
  --header 'Content-Type: application/json' \
  --header "X-API-KEY: ${API_KEY}" \
  --data "${JSON_PAYLOAD}")

# Execute the API call and capture the output
OUTPUT="$API_CALL"

# Log both standard output and standard error to a file
echo "$OUTPUT" >> "$LOG_DIR/output.log" 