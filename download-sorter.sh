#!/bin/bash

# for notifications make sure notify-send is installed

####################
# Checking folders #
####################

if [ -d ~/Downloads ]; then
    echo "~/Downloads folder exists"
    if [ -d ~/Downloads/audio ]; then
        echo "~/Downloads/audio folder exists"
    else
        notify-send "~/Downloads/audio folder does not exist, creating a new one"
        mkdir -p ~/Downloads/audio
    fi

    if [ -d ~/Downloads/documents ]; then
        echo "~/Downloads/documents folder exists"
    else
        notify-send "~/Downloads/documents folder does not exist, creating a new one"
        mkdir -p ~/Downloads/documents 
    fi

    if [ -d ~/Downloads/images ]; then
        echo "~/Downloads/images folder exists"
    else
        notify-send "~/Downloads/images folder does not exist, creating a new one"
        mkdir -p ~/Downloads/images 
    fi

    if [ -d ~/Downloads/videos ]; then
        echo "~/Downloads/videos folder exists"
    else
        notify-send "~/Downloads/videos folder does not exist, creating a new one"
        mkdir -p ~/Downloads/videos
    fi

else
    notify-send "Error: ~/Downloads folder does not exist, Exiting"
    exit
fi


#######################
# Sort files by types #
#######################

cd ~/Downloads
for file in *; do
    type=$(file --mime-type -b "$file")

    echo "$file is of type $type"

    if [[ "$type" == audio/* ]]; then
        mv $file ~/Downloads/audio/$file
    fi

    if [[ "$type" == text/* ]]; then
        mv $file ~/Downloads/documents/$file
    fi

    if [[ "$type" == image/* ]]; then
        mv $file ~/Downloads/images/$file
    fi

    if [[ "$type" == video/* ]]; then
        mv $file ~/Downloads/videos/$file
    fi

done

notify-send "~/Downloads directory sorted successfully"
