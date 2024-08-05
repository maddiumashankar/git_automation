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
```

## Flags
-m <commit-message>: Commit message for the changes. (Required)
-b <branch-name>: Name of the branch to push to. Default is main.
-r <remote-name>: Name of the remote repository. Default is origin.
-u <remote-url>: URL of the remote repository. If not provided, the script will not add a remote.

## Example: 
```bash
./git_automation.sh -m "Initial commit" -b "master" -r "origin" -u "https://github.com/username/repo.git"
```

## Prerequisites
- Git must be installed on your system.
- The script must have executable permissions. You can set this with the command:
  ```bash
  chmod +x git_automation.sh
  ```
