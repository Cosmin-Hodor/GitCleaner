#!/bin/bash

# Print a list of all branches in the repository.
echo "All branches in repository:"
git branch --list

# Prompt the user to enter the branch names to keep.
echo "Enter the branch names to keep (comma-separated): "
read branches_to_keep

# Convert the comma-separated list of branch names to an array.
IFS=',' read -ra branch_array <<< "$branches_to_keep"

# Print a list of branches that will not be deleted.
echo "Branches that will NOT be deleted:"
for branch in "${branch_array[@]}"; do
  echo $branch
done

# Prompt the user to confirm that they want to delete the other branches.
read -p "Are you sure you want to delete all other branches? [y/N] " confirm
if [[ "$confirm" != "y" ]]; then
  echo "Aborting script."
  exit 1
fi

# Delete all branches except the ones in the array.
for branch in $(git branch | sed 's/*//g'); do
  if [[ ! " ${branch_array[@]} " =~ " ${branch} " ]]; then
    git branch -D $branch
  fi
done

# Output a message to let the user know which branches were kept.
echo "Branches kept: ${branch_array[@]}"

$SHELL
