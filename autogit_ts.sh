#!/bin/bash

set -o errexit

FILE=$1
TS_FILE="*.ts"

echo "Enter name: "
read name

echo "Enter token: "
read -s token

if [[ $FILE == $TS_FILE ]]
then
    mv $FILE ~/repos/Laboratory-1/
    cd ~/repos/Laboratory-1/
    git remote set-url origin https://${token}@github.com/${name}/Laboratory-1.git
    
    if [[ "$(git rev-parse --abbrev-ref HEAD)" -eq main ]]
    then
        echo -e "Current branch -> $(git rev-parse --abbrev-ref HEAD)\n"
    else
        echo "** Switching to main branch **"
        git checkout -b main
    fi

    # Add file
    echo "Adding file to Laboratory 1 repository"
    git add $1

    # Commit
    echo "Committing"
    git commit -m "exercise"

    # Push file
    git push
    echo "File pushed successfully!"
else
    echo "ERROR! Not a TypeScript file!"
    exit 1
fi
