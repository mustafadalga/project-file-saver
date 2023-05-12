#!/bin/bash

# Define default output file name
default_output_file="data.txt"

ignore=("$0")
output_file=""

# Function to process a file
process_file() {
    local source="$1"
    local content=$(<"$1")

    echo "source:$source" >> "$output_file"
    echo "" >> "$output_file"
    echo "content:" >> "$output_file"
    echo "$content" >> "$output_file"
    echo "" >> "$output_file"
}

# Function to determine if a file or folder should be ignored
should_ignore() {
    local path="$1"

    # Check if the path matches any ignored file or folder
    for ignored_file in "${ignore[@]}"; do
        if [[ "$path" == *"$ignored_file"* ]]; then
            return 0
        fi
    done

    return 1
}

# Function to scan files in a directory (including nested folders)
scan_files() {
    local dir="$1"

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            if should_ignore "$file"; then
                continue
            fi
            process_file "$file"
        elif [ -d "$file" ]; then
            if should_ignore "$file"; then
                continue
            fi
            scan_files "$file"
        fi
    done
}

# Parse command-line arguments for ignored files and output file
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --ignore)
            shift
            while [[ "$#" -gt 0 ]] && [[ "$1" != --* ]]; do
                ignore+=("$1")
                shift
            done
            ;;
        --output)
            shift
            output_file="$1"
            ignore+=("$1")
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

# If no output file is specified, use the default output file name
if [ -z "$output_file" ]; then
    output_file="$default_output_file"
    ignore+=("$output_file")
    echo "No output file specified, using default: $default_output_file"
fi


# Clear the output file before appending new content
> "$output_file"

# Start scanning files from the current directory (change as needed)
scan_files .

echo "Files processed successfully."
