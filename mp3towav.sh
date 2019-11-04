#! /bin/bash
# Author: Moacyr Rodrigues Neto
# Converter mp3 to wav for Asterisk

if [ $# = 0 ]; then
        echo ""
        echo "To convert all the files in the directory"
        echo "$0 all"
        echo "or"
        echo "To convert a single file"
        echo "$0 FileName.mp3 "
        exit 0
fi

if [ "$1" = "all" ]; then
        for i in *.mp3; do
                if [ -e "$i" ]; then
                        file=`basename "$i" .mp3`
                        lame --decode "$i" "$file.WAV"
                        sox "$file.WAV" -r 8000 -c1 -b 16 "$file.wav"
                        rm "$file.WAV"
                fi
        done
elif [ $# = 1 ]; then
        file=`basename "$1" .mp3`
        lame --decode "$1" "$file.WAV"
        sox "$file.WAV" -r 8000 -c1 -b 16 "$file.wav"
        rm "$file.WAV"
else
        echo "./$0 or ./$0 FileName.mp3"
fi

exit 0
