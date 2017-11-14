#
# bundler
# the following comes from
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/bundler/bundler.plugin.zsh
#
bi() {
  if _bundler-installed && _within-bundled-project; then
    local bundler_version=$(bundle version | cut -d' ' -f3)
    if [[ $bundler_version > '1.4.0' || $bundler_version = '1.4.0' ]]; then
      echo "using $(nproc) jobs"
      bundle install --jobs=$(nproc) $@
    else
      bundle install $@
    fi
  else
    echo "Can't 'bundle install' outside a bundled project"
  fi
}

_bundler-installed() {
  which bundle > /dev/null 2>&1
}

_within-bundled-project() {
  local check_dir=$PWD
  while [[ -n $check_dir ]]; do
    [[ -f "$check_dir/Gemfile" ]] && return 0
    check_dir="${check_dir%/*}"
  done
  return 1
}

_run-with-bundler() {
  if _bundler-installed && _within-bundled-project; then
    bundle exec $@
  else
    $@
  fi
}

for cmd in ruby rake rails rspec irb; do
  alias $cmd="_run-with-bundler $cmd"
done

export rspec_timeout=900

