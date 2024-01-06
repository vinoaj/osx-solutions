#!/bin/bash

# Set the directory to the first argument, or default to the current directory if not provided
DIR=${1:-.}

# Change to the specified directory
cd "$DIR"

# Check if the directory change was successful
if [ $? -ne 0 ]; then
    echo "Cannot change to directory $DIR."
    exit 1
fi

# Change file extension to lowercase
for f in *.HEIC
do 
    mv "$f" "${f%.HEIC}.heic"
done

# Convert HEIC files to PNG and then delete the HEIC files
for f in *.heic
do 
    sips -s format png "${f}" --out "${f%.*}.png"
    rm "$f"
done
