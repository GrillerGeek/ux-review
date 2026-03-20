#!/bin/bash
# Initialize the .ux-review/ directory structure for a UX review session.
# Called by the /ux-review command at the start of each review.

set -e

REVIEW_DIR=".ux-review"

# Create directory structure
mkdir -p "$REVIEW_DIR/personas"
mkdir -p "$REVIEW_DIR/interviews"
mkdir -p "$REVIEW_DIR/walkthroughs"
mkdir -p "$REVIEW_DIR/specialist-reports"
mkdir -p "$REVIEW_DIR/mockups"

# Add .ux-review/ to .gitignore if .gitignore exists and doesn't already include it
if [ -f ".gitignore" ]; then
    if ! grep -qx ".ux-review/" ".gitignore" 2>/dev/null; then
        echo "" >> ".gitignore"
        echo "# UX Review artifacts" >> ".gitignore"
        echo ".ux-review/" >> ".gitignore"
    fi
fi

echo "UX review workspace initialized at $REVIEW_DIR/"
