#!/bin/sh



for file in "$(ls ~/.cache | grep org-points )";
do
    DATE=$(date +'%d-%m-%Y' --date=$(echo $file | sed 's/org-points-//g' | sed 's/\.points//g'))
    SCORE=$(cat $file | paste -sd + | bc)
    echo $DATE,$SCORE
done
