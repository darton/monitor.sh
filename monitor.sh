#!/bin/bash

function poweroff {
        echo 'standby 0' | cec-client -s -d 1 /dev/cec0
        sleep 1
        echo 'standby 0' | cec-client -s -d 1 /dev/cec1
}

function poweron {
        echo 'on 0' | cec-client -s -d 1 /dev/cec0
        sleep 10
        echo 'as' | cec-client -s -d 1 /dev/cec0
        sleep 2
        echo 'on 0' | cec-client -s -d 1 /dev/cec1
        sleep 10
        echo 'as' | cec-client -s -d 1 /dev/cec0
}

function status {
        echo 'pow 0' | cec-client -s -d 1 /dev/cec0 | grep -v ERROR
        sleep 1
        echo 'pow 0' | cec-client -s -d 1 /dev/cec1 | grep -v ERROR
}

function volumedown {
    echo voldown | cec-client -s -d 1  /dev/cec0
}

function volumeup {
    echo volup | cec-client -s -d 1  /dev/cec0
}


case "$1" in

    'on')
        poweron
    ;;
    'off')
        poweroff
    ;;
    'status')
        status
    ;;
    'volumeup')
        volumeup
    ;;
    'volumedown')
        volumedown
    ;;

     *)
        echo -e "\nUsage: monitor.sh on|off|status|volumeup|volumedown"
    ;;
    esac
