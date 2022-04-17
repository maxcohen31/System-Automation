#!/bin/bash

function timer() {
  time=$1
  for ((i=time; i>0; i--)); do
    sleep 1;
    printf "Time remaining: $i seconds \r"; done
  echo -e "\a"  
}
