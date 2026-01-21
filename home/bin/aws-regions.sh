#!/usr/bin/env bash
set -euo pipefail

curl -sqfLm 5 "https://raw.githubusercontent.com/aws/aws-sdk-js-v3/refs/heads/main/packages/util-endpoints/src/lib/aws/partitions.json" |
	jq -r '.partitions | map(select(.id == "aws")) | map(.regions | to_entries | map({region: .key, name: .value.description}) ) | flatten | map(join(",")) | join("\n")'
