#!/usr/bin/env bash
set -euo pipefail

file=/usr/share/vscodium-bin/resources/app/product.json
echo "Current state"
jq '.extensionsGallery' < "$file"

serviceUrl="https://marketplace.visualstudio.com/_apis/public/gallery"
cacheUrl="https://vscode.blob.core.windows.net/gallery/index"
itemUrl="https://marketplace.visualstudio.com/items"

replaced=$(jq -r --arg s "$serviceUrl" --arg c "$cacheUrl" --arg i "$itemUrl" \
  '.extensionsGallery = {serviceUrl: $s, cacheUrl: $c, itemUrl: $i}' < "$file")
echo "$replaced" > "$file"
echo "Patched state"
jq '.extensionsGallery' < "$file"
