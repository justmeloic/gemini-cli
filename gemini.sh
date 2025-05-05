#!/bin/bash

# Get the API key from an environment variable

GEMINI_API_KEY=${GEMINI_API_KEY}

# Check if a prompt is provided
if [ -z "$1" ]; then
  echo "Usage: gemini \"Your prompt here\""
  exit 1
fi

# Construct the prompt
prompt="Be concise. If asked for a command, onlye give the commands. If asked for a script only give the script. Generate $1"

# Build the curl command and pipe the output to jq
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$GEMINI_API_KEY" \
-H 'Content-Type: application/json' \
-X POST \
-d "{
  \"contents\": [{
    \"parts\":[{\"text\": \"$prompt\"}]
  }]
}" | jq -r '.candidates[0].content.parts[0].text' | sed 's/`python//g' | sed 's/`//g'
