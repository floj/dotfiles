
export __VFOX_SHELL=$'zsh';export PATH=$'/home/flo/.version-fox/temp/1717106400-28636/nodejs/bin:/home/flo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/flo/.luarocks/bin:/home/flo/go/bin:/home/flo/.local/bin';

export __VFOX_PID=$$;

_vfox_hook() {
  trap -- '' SIGINT;
  eval "$("/usr/bin/vfox" env -s zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_vfox_hook]+1}" ]]; then
  precmd_functions=( _vfox_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_vfox_hook]+1}" ]]; then
  chpwd_functions=( _vfox_hook ${chpwd_functions[@]} )
fi

trap 'vfox env --cleanup' EXIT
