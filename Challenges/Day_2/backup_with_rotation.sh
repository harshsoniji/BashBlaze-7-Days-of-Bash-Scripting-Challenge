#!/bin/bash

# # Check if the directory path is provided as a command-line argument
# if [ $# -eq 0 ]; then
#     echo "Error: Please provide the directory path as a command-line argument."
#     exit 1
# fi

# backup_directory=$1

# # Create a timestamped backup folder
# timestamp=$(date +%Y%m%d%H%M%S)
# backup_folder="${backup_directory}/backup_${timestamp}"
# mkdir -p "$backup_folder"

# # Copy all files from the specified directory into the backup folder
# cp -r "${backup_directory}"/* "$backup_folder"

# # Use rsync to copy all files from the specified directory into the backup folder
# #rsync -av --exclude="${backup_folder}" "${backup_directory}/" "$backup_folder"

# # Implement rotation to keep only the last 3 backups
# backup_folders=(${backup_directory}/backup_*)

# if [ "${#backup_folders[@]}" -gt 3 ]; then
#     # Sort backup folders by timestamp in ascending order
#     sorted_backup_folders=($(printf "%s\n" "${backup_folders[@]}" | sort -n))

#     # Determine the number of folders to remove
#     folders_to_remove=$(( ${#sorted_backup_folders[@]} - 3 ))

#     # Remove the oldest backup folders to keep only the last 3
#     for (( i=0; i<"$folders_to_remove"; i++ )); do
#         rm -rf "${sorted_backup_folders[$i]}"
#     done
# fi

# echo "Backup completed successfully."

#we will take source path from user and gets stored in $1
src_path=$1

#we will store the current date and time in 2 variables
fname="$(date '+%Y-%m-%d')"
time="$(date '+%I-%M-%S')"

#storing the name of the backup file in f_name
f_name=backup_$fname"_"$time.tar.gz

#this line will zip the files present in $src_path
tar -czf $f_name $src_path

echo "Backup Created: $PWD/$f_name"

#deleting the files except the 3 latest backup files
rm -f $(ls -1t *.tar.gz | tail -n +4)
