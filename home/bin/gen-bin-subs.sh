#!/usr/bin/env bash
set -uo pipefail
# remove $HOME/bin from path there. We want to find the real binaries
PATH=":$PATH:"
PATH="${PATH//:$HOME\/bin:/:}"
PATH="${PATH#:}"
PATH="${PATH%:}"

# if command -v aws-vault &>/dev/null; then
  for f in aws packer terraform saw cw awslogs; do
    targetBin=$(command -v "$f")
    if [[ -z $targetBin ]]; then
      [[ -x $HOME/bin/$f-bin ]] && targetBin=$HOME/bin/$f-bin
    fi
    if [[ -z $targetBin ]]; then
      echo "$f not found in path, skipping"
      continue
    fi
    echo "Generating binstub for $f ($targetBin)"

    cat<<EOF>"$HOME/bin/$f"
#!/usr/bin/env bash
set -e
if [[ -n \$AWS_VAULT ]] || [[ -n \$VIMRUNTIME ]]; then
  exec "$targetBin" "\$@"
fi
aws_profile=\$AWS_PROFILE
if [[ -z \$aws_profile ]]; then
  exec "$targetBin" "\$@"
fi
assume_role_ttl=\${AWS_ASSUME_ROLE_TTL:-20}m
exec aws-vault exec --ecs-server "\$aws_profile" -- "$targetBin" "\$@"
EOF
  echo "$f" >> .gitignore
  chmod +x "$HOME/bin/$f"
  done
# else
#   echo "aws-vault not found"
# fi

uniqGitignore=$(sort -u .gitignore)
echo "$uniqGitignore" > .gitignore
