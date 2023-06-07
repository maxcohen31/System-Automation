#! /bin/bash

set -o errexit

TEST=$1
SUB="_test.py"

echo "Insert name: "
read name

echo "Insert token: "
read -s token

# Check for substring
if [[ "$TEST" == *"$SUB"* ]]
then
    mv $TEST repos/Codewars-Solutions/Codewars/Test/
    cd ~/repos/Codewars-Solutions/Codewars/Test/ 
    git remote set-url origin https://${token}@github.com/${name}/Codewars-Solutions.git

    # Check for main branch else swith
    if [[ "$(git rev-parse --abbrev-ref HEAD)" -eq main ]]
    then
        echo -e "\nYou are on $(git rev-parse --abbrev-ref HEAD ) branch\n"
    else
        echo -e "\n[+]Switching to main branch[+]\n"
    fi

    # add file
    echo "adding file..."
    git add .

    # commit file
    echo "Writing comment..."
    git commit -m "adding test"

    # push file
    echo "File pushed successfully!"
    git push
else
    echo "$TEST is not a test file!"
    exit 1
fi
        
