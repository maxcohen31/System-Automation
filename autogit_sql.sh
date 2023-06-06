#!/bin/bash

set -o errexit

FILE=$1
SQL_FILE=*.sql


echo "Enter name: "
read name

echo "Enter token: "
read -s token

if [[ $FILE == $SQL_FILE ]]
then
    mv $FILE ~/repos/Codewars-Solutions/Codewars/SQL/
    cd ~/repos/Codewars-Solutions/Codewars/SQL/
    git remote set-url origin https://${token}@github.com/${name}/Codewars-Solutions.git

    # check if current branch is main
    if [[ "$(git rev-parse --abbrev-ref HEAD)" -eq main ]]
    then
        echo -e "\nYou are on $(git rev-parse --abbrev-ref HEAD) branch\n"
    else
        # switch to main branch
        echo -e "\n[+]Switching to main branch[+]\n"
        git checkout -b main
    fi
    
    # add file
    echo "Adding file..."
    git add .
    
    # commit file 
    echo "Writing commit..."
    git commit -m "sql kata"
    
    # push file
    git push
    echo "File pushed successfully!"
else
    echo "$FILE is not a cpp file!"
    exit 1  
fi    

