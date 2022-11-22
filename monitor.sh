#!/bin/bash

function poweroff {
        echo 'standby 0.0.0.0' | cec-client -s -d 1 /dev/cec0
        echo 'standby 0.0.0.0' | cec-client -s -d 1 /dev/cec1
}

function poweron {
        echo 'on 0.0.0.0' | cec-client -s -d 1 /dev/cec0
        echo 'on 0.0.0.0' | cec-client -s -d 1 /dev/cec1
}

function status {
        echo 'pow 0.0.0.0' | cec-client -s -d 1 /dev/cec0
        echo 'pow 0.0.0.0' | cec-client -s -d 1 /dev/cec1
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
        *)
        echo -e "\nUsage: monitor.sh standby|on|status"
    ;;
    esac
