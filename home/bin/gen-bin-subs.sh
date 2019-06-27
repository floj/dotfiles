#!/usr/bin/env bash
set -uo pipefail
# remove $HOME/bin from path there. We want to find the real binaries
PATH=":$PATH:"
PATH="${PATH//:$HOME\/bin:/:}"
PATH="${PATH#:}"
PATH="${PATH%:}"

# if command -v aws-vault &>/dev/null; then
  for f in aws packer terraform cw saws saw awless; do
    targetBin=$(command -v "$f")
    if [[ -z $targetBin ]]; then
      echo "$f not found in path, skipping"
      continue
    fi
    echo "Generating binstub for $f ($targetBin)"

    cat<<EOF>"$HOME/bin/$f"
#!/usr/bin/env bash
set -e
if [[ -n \$AWS_VAULT ]]; then
  exec "$targetBin" "\$@"
fi
aws_profile=\${AWS_PROFILE}
if [[ -z \$aws_profile ]]; then
  exec "$targetBin" "\$@"
fi
exec aws-vault exec --prompt=automfa "\$aws_profile" -- "$targetBin" "\$@"
EOF
  echo "$f" >> .gitignore
  chmod +x "$HOME/bin/$f"
  done
# else
#   echo "aws-vault not found"
# fi

