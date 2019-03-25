#!/bin/bash
# Ask the user for their name
echo Input Filename:
read inputfile
echo Output Filename:
read outputfile

python log_split.py $inputfile | ruby mail_filter.rb | java EmailWriter $outputfile

echo File $outputfile created