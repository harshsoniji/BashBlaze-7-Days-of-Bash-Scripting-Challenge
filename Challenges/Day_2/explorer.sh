#!/bin/bash

# echo "Welcome to the Interactive File and Directory Explorer!"
# echo -e "\033[32m===========================================\033[0m"

# ### Part 1: File and Directory Exploration
# echo "Files and Directories in the Current Path:"

# # Function to get human-readable size
# get_human_readable_size() {
#     du -h "$1" | awk '{print $1}'
# }
# # List files and directories in the desired order
# find . -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
#     size=$(get_human_readable_size "$file")
#     printf "%s (%s)\n" "$(basename "$file")" "$size"
# done

# find . -maxdepth 1 -type d -print0 | while IFS= read -r -d '' dir; do
#     size=$(get_human_readable_size "$dir")
#     printf "%s (%s)\n" "$(basename "$dir")" "$size"
# done

# echo -e "\033[32m===========================================\033[0m"


# while true; do
#     read -p "Enter a line of text (Press Enter without text to exit): " input

#     if [[ -z "$input" ]]; then
#         echo "Exiting the Interactive Explorer. Goodbye!"
#         break
#     fi

#     char_count=${#input}
#     echo "Character Count: $char_count"
# done

echo "Welcome to the Interactive File and Directory Explorer!"

#ls -lh will give us the list of files and directories with their size in human readable format
# awk will help us to print the 9th and 5th column of that output
echo "Files and Directories in the Current Path:"
ls -lh | awk '{print "-",$10,"(",$6,")"}'

#checking if the length of msg variable is 0, it will break out of the loop
while [ True ];
do
	read -p "Enter a line of text(Press enter without text to exit): " msg
	if [ ${#msg} -eq 0 ]
	then
		break	
	fi	
	echo "Character Count: ${#msg} "
done

echo "Exiting the Interactive Explorer. Goodbye!"