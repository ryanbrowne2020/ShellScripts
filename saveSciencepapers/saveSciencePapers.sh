#!/bin/bash

# This script will download the associated papers from a list of DOI.
# The author of this script, Ryan Browne, does not advocate for copyright
# infringment or unauthorised access to papers. 
# Please use only for papers you have access to through your institution,
# or have otherwise purchased. Please use at your own discretion. 

addDate_dir=$(date +"%m-%d-%Y")

cd /Users/ryan
mkdir "ScienceDownload${addDate_dir}"
cp Sciencelines.txt ScienceDownload${addDate_dir} #format is one DOI per line
cp extractSRC.py ScienceDownload${addDate_dir}
cp checkifFound.py ScienceDownload${addDate_dir}
cd ScienceDownload${addDate_dir}

cat Sciencelines.txt | while read line
do
  getline="https://sci-hub.se/$line"
  curl -0 $getline > html.txt
  python extractSRC.py | cut -f1 -d\# > stripped.txt
  python checkifFound.py >> notFound.txt
  cat stripped.txt | while read line2
  do
    curl -O "https://sci-hub.se$line2"
  done
  rm html.txt
  rm stripped.txt
done

echo "############"
echo "All finished!"
echo "############"
