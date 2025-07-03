#!/bin/bash
# Update Neovim config from LazyVim starter upstream

echo "Fetching updates from LazyVim starter..."
git fetch upstream

echo "Merging upstream changes..."
git merge upstream/main

echo "Pushing updates to your fork..."
git push origin main

echo "Update complete!"