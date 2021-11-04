#! /bin/bash

fs="/"
percentage=$(df -h  $fs | tail -n 1 | awk '{print$5}' | cut -d % -f1)
if [ $percentage -ge 50 ]; then
  message="Sending warning! Usage above $percentage"
  echo $message |  mail -s "%fs is %percentage full" eman_93@hotmail.it
fi

