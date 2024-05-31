#!/usr/bin/env bash
set -euo pipefail
scriptDir=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

echo "atuin"
atuin init zsh >"$scriptDir/atuin.init.zsh"

echo "direnv"
direnv hook zsh >"$scriptDir/direnv.init.zsh"

echo "zoxide"
zoxide init zsh >"$scriptDir/zoxide.init.zsh"

echo "vfox"
#vfox activate zsh | sed 's|;export PATH.*||' >"$scriptDir/vfox.init.zsh"
vfox activate zsh >"$scriptDir/vfox.init.zsh"
