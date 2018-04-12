#!/usr/bin/env bash
set -eou pipefail

while [[ -n ${1:-} ]]; do
  name=$1; shift
  echo -n "Activating $name... "
  target=./available/_$name
  if [[ ! -f $target ]]; then
    echo "No completition found for $name, file $target does not exist"
    continue
  fi
  src=./active/_$name
  if [[ -e $src ]]; then 
    echo "already active."
    continue
  fi
  ln -sT "../available/_$name" "$src"
  echo "done."
done
