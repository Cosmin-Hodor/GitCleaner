#!/bin/bash

# Prompt the user to input branches separated by ","
echo "Enter branches to keep (separated by ','): "
read branches_to_keep

# Convert the input to an array
IFS=',' read -ra branches_to_keep_array <<< "$branches_to_keep"

# Prompt the user to choose whether to delete branches only locally, only remotely, or both
echo "Do you want to delete branches only locally (L), only remotely (R), or both (B)?"
read deletion_type

if [[ $deletion_type == [Ll] ]]; then
  # Delete branches only locally
  for branch in $(git branch | grep -vE "HEAD|$(IFS='|' ; echo "${branches_to_keep_array[*]}")"); do
      echo "Deleting local branch $branch..."
      git branch -D $branch
  done
elif [[ $deletion_type == [Rr] ]]; then
  # Delete branches only remotely
  for branch in $(git branch -r | grep -vE "HEAD|$(IFS='|' ; echo "${branches_to_keep_array[*]}")"); do
      echo "Deleting remote branch $branch..."
      git push origin --delete $(echo $branch | sed 's/origin\///')
  done
else
  # Delete branches both locally and remotely
  for branch in $(git branch -a | grep -vE "HEAD|$(IFS='|' ; echo "${branches_to_keep_array[*]}")"); do
      if [[ $branch == remotes* ]]; then
          echo "Deleting remote branch $(echo $branch | sed 's/origin\///')..."
          git push origin --delete $(echo $branch | sed 's/origin\///')
      else
          echo "Deleting local branch $branch..."
          git branch -D $branch
      fi
  done
fi
