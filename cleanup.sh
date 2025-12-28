#!/bin/bash

echo "Cleanup"

echo "Cleaning up Homebrew caches..."
brew cleanup

echo "Removing Homebrew cache files..."
rm -f -r /Library/Caches/Homebrew/* 2>/dev/null || sudo rm -f -r /Library/Caches/Homebrew/*

echo "✓ Cleanup complete!"