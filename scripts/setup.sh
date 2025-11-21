#!/bin/bash
# Setup script for the repository

echo "Setting up yan-defter repository..."

# Check for required tools
command -v git >/dev/null 2>&1 || { echo "git is required but not installed. Aborting." >&2; exit 1; }

echo "Repository setup complete!"
echo "You can now explore the code examples in various directories."
