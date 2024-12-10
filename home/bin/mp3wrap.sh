#!/usr/bin/env bash
set -euo pipefail

targetFile=$1
shift
echo "TAGRET: $targetFile"

declare -i batch=200
if [[ "$#" -lt $batch ]]; then
	mp3wrap "$targetFile" "$@"
	mp3val -f -nb "${targetFile%".mp3"}_MP3WRAP.mp3"
	exit
fi

declare -i cnt=0
declare -a tmpFiles=()

cleanup() {
	local f
	for f in "${tmpFiles[@]}"; do
		[[ -f "$f" ]] || continue
		echo "cleaning up $f"
		rm "$f"
	done
}

trap cleanup EXIT
while true; do
	files=("${@:$cnt:$batch}")
	[[ ${#files[@]} -gt 0 ]] || break
	echo "############# $cnt"
	tmp=$(mktemp)
	tmpFiles+=("${tmp}_MP3WRAP.mp3")
	declare -p files
	echo "${#files[@]}"
	mp3wrap "$tmp" "${files[@]}"
	cnt=$((cnt + batch))
done

mp3wrap "$targetFile" "${tmpFiles[@]}"
mp3val -f -nb "${targetFile%".mp3"}_MP3WRAP.mp3"
