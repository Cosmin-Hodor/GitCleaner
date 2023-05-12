#!/bin/bash

# Prompt the user to input branches separated by ","
echo "Enter branches to keep (separated by ','): "
read branches_to_keep

# Convert the input to an array
IFS=',' read -ra branches_to_keep_array <<< "$branches_to_keep"

# Delete all branches except the ones specified by the user
for branch in $(git branch -r | grep -vE "HEAD|$(IFS='|' ; echo "${branches_to_keep_array[*]}")"); do
    echo "Deleting $branch..."
    git branch -D $(echo $branch | sed 's/origin\///')
    git push origin --delete $(echo $branch | sed 's/origin\///')
done

$SHELL
