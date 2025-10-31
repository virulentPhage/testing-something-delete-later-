#!/bin/sh
# file path to the interpreter so it can run this script

getFileHash () {
    filePath=$1
    saveLocation=$2
    # these are parameters for the function
    
    # below line gets sha256 sum of the file and stores it
    # the $() means bash runs the command inside the parentheses
    # and captures its output. the command gets the output of
    # sha256 sum and since it is words and not just the hash, 
    # I have to use awk to select/cut out only the 4th
    # column of what was printed (which is where the print $4 
    # comes from), which is just the hash
    theHash=$(sha256 "$filePath" | awk '{print $4}')
    #freeBSD and PfSense have sha256 preinstalled instead of
    # sha256sum

    currentTime=$(date +"%H:%M:%S")
    # gets current hours, mins, seconds. 
    # date is a command that prints the date and time
    # string afterwards formats it into hours:minutes:seconds

    logLine="Date: ${currentTime} | File path: ${filePath} | Hash: ${theHash}\n"
    # each thing inside curly braces with a $ is the value of a variable

    printf "$logLine" >> "$saveLocation"
    # cant use echo in sh, so instead I have to use printf,
    # which is very similar but has some different options for printing
    
}


main () {
    getFileHash "/media/phage/1TB/blueteamstuff/scripts" \ "/media/phage/1TB/blueteamstuff/scripts/pusheen/miscStorage/fileOfHashes.txt"

}


main 
