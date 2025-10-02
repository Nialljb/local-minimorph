#!/bin/bash

INPUT_BASE_DIR="/path/to/sessions"
OUTPUT_BASE_DIR="/path/to/output"
DOCKER_IMAGE="your-gear-local"
LOG_FILE="processing.log"

# Create log file
echo "Starting batch processing: $(date)" > "$LOG_FILE"

for session_dir in "$INPUT_BASE_DIR"/*/; do
    if [ -d "$session_dir" ]; then
        session_name=$(basename "$session_dir")
        output_dir="$OUTPUT_BASE_DIR/$session_name"
        
        echo "Processing: $session_name" | tee -a "$LOG_FILE"
        mkdir -p "$output_dir"
        
        # Run with timeout and error handling
        if timeout 3600 docker run --rm \
            -v "$session_dir":/app/input \
            -v "$output_dir":/app/output \
            "$DOCKER_IMAGE"; then
            echo "SUCCESS: $session_name" | tee -a "$LOG_FILE"
        else
            echo "ERROR: $session_name failed" | tee -a "$LOG_FILE"
        fi
    fi
done