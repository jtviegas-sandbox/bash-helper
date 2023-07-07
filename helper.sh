#!/usr/bin/env bash

# ===> COMMON SECTION START  ===>
# http://bash.cumulonim.biz/NullGlob.html
shopt -s nullglob

if [ -z "$this_folder" ]; then
  this_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
  if [ -z "$this_folder" ]; then
    this_folder=$(dirname $(readlink -f $0))
  fi
fi
parent_folder=$(dirname "$this_folder")

. "$this_folder/helper.inc"
# -------------------------------
# --- FUNCTIONS SECTION ---

commands() {
  cat <<EOM
        commands:
              start xyz:                         xyz
EOM
}


# -------------------------------
# --- MAIN SECTION ---

usage() {
  cat <<EOM
      usages:
        $(basename $0) {commands}
            commands              : show useful commands
EOM
}

info "starting [ $0 $1 $2 $3 $4 ] ..."
_pwd=$(pwd)

case "$1" in
commands)
  commands
  ;;
*)
  usage
  ;;
esac
info "...[ $0 $1 $2 $3 $4 ] done."