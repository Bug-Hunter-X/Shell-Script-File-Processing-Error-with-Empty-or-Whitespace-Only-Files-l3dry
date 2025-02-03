#!/bin/bash

file_to_process="my_file.txt"

if [ ! -f "$file_to_process" ]; then
  echo "Error: File not found."
exit 1
fi

#Improved check for empty or whitespace-only file
if [[ -s "$file_to_process" ]]; then
  while IFS= read -r line; do
    # Trim leading/trailing whitespace and check for empty lines
    trimmed_line=$(echo "$line" | xargs)
    if [[ -n "$trimmed_line" ]]; then
      echo "Processing: $trimmed_line"
    fi
  done < "$file_to_process"
else
    echo "Warning: File is empty or contains only whitespace."
fi

#The rest of the code