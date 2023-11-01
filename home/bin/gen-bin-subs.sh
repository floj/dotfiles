#!/usr/bin/env bash
set -uo pipefail

# remove $HOME/bin from path there. We want to find the real binaries
PATH=":$PATH:"
PATH="${PATH//:$HOME\/bin:/:}"
PATH="${PATH#:}"
PATH="${PATH%:}"

# if command -v aws-vault &>/dev/null; then
for f in aws packer terraform saw cw awslogs s3surfer; do
	targetBin=$(command -v "$f")
	if [[ -z $targetBin ]]; then
		[[ -x $HOME/bin/$f-bin ]] && targetBin=$HOME/bin/$f-bin
	fi
	if [[ -z $targetBin ]]; then
		echo "$f not found in path, skipping"
		continue
	fi
	echo "Generating binstub for $f ($targetBin)"

	cat <<'EOF' >"$HOME/bin/$f"
#!/usr/bin/env bash
set -euo pipefail
debug(){
  if [[ ${DEBUG:-} == 1 ]]; then
    printf "%s\n" "$*" >> "$HOME/binstubs.log"
  fi
}
if [[ -n ${AWS_VAULT:-} ]] || [[ -n ${VIMRUNTIME:-} ]] || [[ -n ${TF_IN_AUTOMATION:-} ]]; then
  debug "direct exec: $(basename "${BASH_SOURCE[0]}") $*"
  exec "<targetBin>" "$@"
fi
if [[ -z ${AWS_PROFILE:-} ]]; then
  debug "direct exec (no profile): $(basename "${BASH_SOURCE[0]}") $*"
  exec "<targetBin>" "$@"
fi
debug "exec via aws-vault: $(basename "${BASH_SOURCE[0]}") $*"
exec aws-vault exec --ecs-server "$AWS_PROFILE" -- "<targetBin>" "$@"
EOF
	sed -i "s|<targetBin>|$targetBin|g" "$HOME/bin/$f"
	echo "$f" >>.gitignore
	chmod +x "$HOME/bin/$f"
done
# else
#   echo "aws-vault not found"
# fi

uniqGitignore=$(sort -u .gitignore)
echo "$uniqGitignore" >.gitignore
