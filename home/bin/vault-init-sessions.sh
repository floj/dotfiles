#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${VAULT_INIT_PATTERN:-}" ]]; then
	echo "VAULT_INIT_PATTERN not set, exiting"
	exit 1
fi

declare -a profiles
mapfile -t profiles <<<"$(aws-vault list --profiles | grep -E "$VAULT_INIT_PATTERN")"

i=0
for p in "${profiles[@]}"; do
	printf "%-15s (%d of %d)" "$p" "$((++i))" "${#profiles[@]}"
	if ! resp=$(aws-vault exec "$p" aws sts get-caller-identity 2>&1); then
		printf " FAILED\n%s\n" "$resp"
		continue
	fi
	printf " OK\n"
done
