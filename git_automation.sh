#!/bin/bash

usage() {
    echo "Usage: $0 -m <commit-message> [-b <branch-name(default='main')>] [-r <remote-name(default='origin')>] [-u <remote-url>]"
    exit 1
}

check_git_installed() {
    if ! command -v git &> /dev/null; then
        echo "Git is not installed. Please install Git and try again."
        exit 1
    fi
}

check_git_config() {
    if [ -z "$(git config --global user.name)" ]; then
        read -p "Enter your Git username: " username
        git config --global user.name "$username"
    fi
    if [ -z "$(git config --global user.email)" ]; then
        read -p "Enter your Git email: " email
        git config --global user.email "$email"
    fi
}

add_files() {
    read -p "Do you want to add all files? (y/n): " add_all
    if [ "$add_all" = "y" ]; then
        echo "Adding all changes to the staging area..."
        git add .
    else
        echo "Start typing the filenames to add and press Enter when done:"
        files=()
        while true; do
            read -e -p "> " -i "" file
            [[ -z "$file" ]] && break
            files+=("$file")
        done
        echo "Adding specified files to the staging area..."
        git add "${files[@]}"
    fi
}

echo "-------------------------------------------------"
echo "██╗   ██╗███╗   ███╗ █████╗ 
██║   ██║████╗ ████║██╔══██╗
██║   ██║██╔████╔██║███████║
██║   ██║██║╚██╔╝██║██╔══██║
╚██████╔╝██║ ╚═╝ ██║██║  ██║
 ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝
"

echo "Author: Maddi Umashankar"
echo "aka: krIPt0k1d"
echo "--------------------------------------------------"

branch="main"
remote="origin"

while getopts "m:b:r:u:" opt; do
    case $opt in
        m) commit_message="$OPTARG" ;;
        b) branch="$OPTARG" ;;
        r) remote="$OPTARG" ;;
        u) remote_url="$OPTARG" ;;
        *) usage ;;
    esac
done

if [ -z "$commit_message" ]; then
    usage
fi

check_git_installed
check_git_config

if [ ! -d .git ]; then
    echo "Initializing new Git repository..."
    git init
fi

add_files

echo "Committing changes with message: $commit_message"
git commit -m "$commit_message"

if [ "$branch" != "main" ]; then
    echo "Creating and switching to branch: $branch"
    git checkout -b "$branch"
fi

if [ -n "$remote_url" ]; then
    echo "Adding remote repository: $remote ($remote_url)"
    git remote add "$remote" "$remote_url"
fi

echo "Pushing changes to $remote/$branch..."
git push -u "$remote" "$branch"

echo "Git automation script completed successfully."

