## Contributing

Contributions are always welcome!

Feel free to open PR's with changes and upgrades.


## Distribution & Usage

Each written line of code is open to the public and freely available.

Do as you please with it, no responsability taken on the owners behalf.

Am not responsable for any damages or potential changes brought by other contributors, if any.

## How to

This tool can be used to delete all branches in a Git repository except for a specific set of branches specified by the user. 
To use the script, save the code to a file with a .sh extension (e.g., GitCleaner.sh), navigate to the directory where the file is saved using the command line, and then run the script by typing ./GitCleaner.sh and pressing Enter.

The script will prompt the user to enter a comma-separated list of branch names to keep. It will then print a list of all branches in the repository and a list of branches that will NOT be deleted based on the user's input.

The user will then be prompted to confirm whether they want to delete all other branches. If they type "y" and press Enter, the script will delete all branches except for the ones in the user's input. If they type "N" or any other character and press Enter, the script will exit without deleting any branches.

Once the script finishes running, it will output a message indicating which branches were kept. It's important to note that this script will permanently delete branches from the repository, so it's recommended to use it with caution and make sure you don't accidentally delete any branches you want to keep.