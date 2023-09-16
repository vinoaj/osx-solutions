#!/bin/bash

# Requires Poppler
# brew intall poppler

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input-pdf-file>"
    exit 1
fi

# Get the input PDF file
input_pdf="$1"

# Check if the input PDF file exists
if [ ! -f "$input_pdf" ]; then
    echo "The input PDF file does not exist."
    exit 1
fi

# Extract the filename without the extension
filename_no_ext=$(basename -- "$input_pdf")
extension="${filename_no_ext##*.}"
filename_no_ext="${filename_no_ext%.*}"

# Convert the PDF to PNG using pdftoppm
pdftoppm -png "$input_pdf" "${filename_no_ext}_page"

echo "PDF has been converted to PNG images with filenames starting with ${filename_no_ext}_page"

