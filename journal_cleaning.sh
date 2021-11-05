#! /bin/bash

journalpath='/var/log/journal/'
action=$(du -sh $journalpath | awk '{print $1}' | cut -d M -f1)

if [ $action -gt 500 ]; then
  journal --vacumm-time=2weeks
else
  echo "Space under 500M"
fi
