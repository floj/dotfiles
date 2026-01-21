#!/usr/bin/env bash
set -euo pipefail
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
script_name="$( basename "${BASH_SOURCE[0]}" )"

if [[ $# -lt 2 ]]; then
  exit 1
fi

target=$1
shift
files="concat:$1"
shift
while [[ $# -gt 0 ]]; do
  files="$files|$1"
  shift
done
#echo "$files"
ffmpeg -i "$files" -acodec copy "$target"
