#!/usr/bin/env python
"""Simplified run script for local execution."""
import subprocess
import sys
import os

def main():
    """Run the main.sh script with mounted input directory."""
    
    # Expect input to be mounted at /app/input
    input_path = "/app/input"
    
    # Check if input directory exists
    if not os.path.exists(input_path):
        print(f"Error: Input directory {input_path} does not exist")
        sys.exit(1)
    
    # Get age parameter from environment variable or use default
    age = os.environ.get('AGE', 'default')
    
    print(f"Processing input: {input_path}")
    print(f"Using age parameter: {age}")
    
    # Run main.sh
    command = ["/app/main.sh", input_path, age]
    
    try:
        result = subprocess.run(command, check=True)
        print("main.sh completed successfully")
    except subprocess.CalledProcessError as e:
        print(f"Error running main.sh: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()