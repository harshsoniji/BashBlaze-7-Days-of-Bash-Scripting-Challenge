#!/bin/bash

echo "Welcome to the Interactive File and Directory Explorer!"
echo -e "\033[32m===========================================\033[0m"

### Part 1: File and Directory Exploration
echo "Files and Directories in the Current Path:"

# Function to get human-readable size
get_human_readable_size() {
    du -h "$1" | awk '{print $1}'
}
# List files and directories in the desired order
find . -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
    size=$(get_human_readable_size "$file")
    printf "%s (%s)\n" "$(basename "$file")" "$size"
done

find . -maxdepth 1 -type d -print0 | while IFS= read -r -d '' dir; do
    size=$(get_human_readable_size "$dir")
    printf "%s (%s)\n" "$(basename "$dir")" "$size"
done

echo -e "\033[32m===========================================\033[0m"


while true; do
    read -p "Enter a line of text (Press Enter without text to exit): " input

    if [[ -z "$input" ]]; then
        echo "Exiting the Interactive Explorer. Goodbye!"
        break
    fi

    char_count=${#input}
    echo "Character Count: $char_count"
done
