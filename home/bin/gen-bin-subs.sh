#!/usr/bin/env bash
set -euo pipefail
# remove $HOME/bin from path there. We want to find the real binaries
PATH=":$PATH:"
PATH="${PATH//:$HOME\/bin:/:}"
PATH="${PATH#:}"
PATH="${PATH%:}"

if command -v aws-vault &>/dev/null; then
  for f in aws packer terraform; do
    targetBin=$(command -v "$f")
    echo "Generating binstub for $f ($targetBin)"

    cat<<EOF>"$HOME/bin/$f"
#!/usr/bin/env bash
set -e
if [[ -n \$AWS_VAULT ]]; then
  exec "$targetBin" "\$@"
fi
if [[ -z \$AWS_VAULT_PROFILE ]]; then
  echo "AWS_VAULT_PROFILE not set"
  exit 1
fi
exec aws-vault --prompt=automfa exec "\$AWS_VAULT_PROFILE" -- "$targetBin" "\$@"
EOF
  chmod +x "$HOME/bin/$f"
  done
fi

