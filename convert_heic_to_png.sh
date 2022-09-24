#!/bin/bash

for f in *.HEIC
do sips -s format png "${f}" --out "${f%.*}.png"
done
