#!/bin/bash

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
    git init
fi

# Configure git to use main as default branch
git config --global init.defaultBranch main
git branch -M main

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit"

# Add remote if it doesn't exist
if ! git remote | grep -q 'origin'; then
    git remote add origin https://github.com/justmeloic/gemini-cli.git
fi

# Push to main branch
git push -u origin main

echo "Repository initialized and pushed successfully!"
