#!/bin/sh


# parameter 1 should be a .txt list of hashes
# could either be the original list of hashes
# from the beginning of the vm or it could be
# a new list made of altered but still ok ones.
# dont make it super long or the search for hashes
# with no matches might take forever

hashList=$1
# each line has a timestamp, filepath, and 
# file hash on it

filePath=$2
# filepath should be the 2nd parameter/argument
# leads to file you want to check

# there should be: originalHashes.txt and 
# alteredHashes.txt


theHash=$(sha256 "$filePath" | awk '{print $4}')
# I could prob reference getHash but im not bc 
# its really not needed, that was only like 3 lines 
# of code max lol

if grep -q "$theHash" "$hashList"; then
    echo "Match found"
else
    echo "No match found"
    timeStamp = $(date +"%H:%M:%S")
    
fi
# grep -q means instead of finding every single
# line that matches your input, it just finds the 
# first match and quits after that. we only need 1 
# valid match

