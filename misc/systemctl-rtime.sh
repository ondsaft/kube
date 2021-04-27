#!/bin/sh

log=systemctl-rtime.log
script_start=`date +%s`

while (true)
do
    T=$(date '+%F-%R')
    start=`date +%s`
    systemctl status syslog-ng > /dev/null
    end=`date +%s`
    elapsed=$((end-start))
    script_elapsed=$((start-script_start))
    echo "$T $script_elapsed $elapsed" >> $log
    echo "$T $script_elapsed $elapsed"
    sleep 5
done