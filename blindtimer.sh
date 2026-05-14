#!/bin/bash

duration=${@}

if [[ ${duration} == "" ]]; then
    notify-send "no duration provided."
    exit
fi

notify-send "Locking in for ${duration} minutes."

sleep 2

for (( x = ${duration}; x > 0; x--)); do
    notify-send "${x} minutes remaining."
    sleep 60
done

notify-send "Times up!!!"
