#!/usr/bin/env bash
latestTag=$(git tag | grep '^v' | sort -V -r | head -1)
echo "Updating to $latestTag"
sed -i -e "s|?ref=v.*\"|?ref=$latestTag\"|g" -- *.tf

