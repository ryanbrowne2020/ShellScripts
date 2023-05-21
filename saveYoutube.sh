#!/bin/bash

#this file will read a list of youtube urls and download them.
#it makes a folder with today's date
#the files lines.txt must be in the top-level directory, as new dir is made

addDate_dir=$(date +"%m-%d-%Y")

cd /Volumes/RyanSDD/
mkdir "YoutubeDownload${addDate_dir}"
cp lines.txt YoutubeDownload${addDate_dir}
cd YoutubeDownload${addDate_dir}


current_line=0

cat lines.txt | while read line
do
  a=($(wc lines.txt))
  total_lines=${a[0]}

  ((++current_line))

  echo "Reading line" $current_line "of" $total_lines "...."
  echo \"$line\"
  yt-dlp --yes-playlist $line
done

echo "############"
echo "All finished!"
echo "############"
