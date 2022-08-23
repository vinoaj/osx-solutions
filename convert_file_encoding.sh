#!/bin/bash

# Converts all SQL files in current subdirectory and subdirectories from UTF-16 to UTF-8 encoding.
# Converted files are placed in ../new_path/ directory
find . -name '*.sql' -exec iconv -f utf-16 -t utf-8 {} -o ../new_path/{} \;	
