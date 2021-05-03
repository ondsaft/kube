#!/bin/sh

ps -e -H -o pid,ppid,rtprio,psr,cmd > /tmp/proc.out

while IFS=' ' read -r pid ppid rtprio psr cmd; do
  
  if [ $pid == "PID" ]
  then
    continue
  fi

  if [ $(($ppid)) -gt 2 ]
  then
    ns=$(sudo nsenter -t $pid -u hostname 2> /dev/null)
    if [ "$ns" != "controller-0" ] && [ "$ns" != "" ]
    then 
        echo pod:$ns cmd:$cmd `taskset -p $pid`
    fi
  fi
done < /tmp/proc.out