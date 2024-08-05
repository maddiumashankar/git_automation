# Git Automation Script

This is a Bash script that automates common Git tasks, including initializing a repository, adding files, committing changes, creating branches, adding remotes, and pushing changes.

## Features

- Checks if Git is installed and prompts the user to install it if not.
- Configures Git username and email if not already set.
- Initializes a new Git repository if one doesn't exist.
- Allows the user to add all files or specify files to add.
- Commits changes with a user-provided commit message.
- Creates and switches to a new branch if specified.
- Adds a remote repository if a URL is provided.
- Pushes changes to the specified remote and branch.

## Usage

```bash
./git_automation.sh -m <commit-message> [-b <branch-name(default='main')>] [-r <remote-name(default='origin')>] [-u <remote-url>]
