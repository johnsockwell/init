#!/bin/false
#
# Initiaize a ZSH environment.
#

# Initialization Parameters
declare -r config_dir="${XDG_CONFIG_HOME:-${HOME}/.config}"
declare -r config_remote="git@github.com:johnsockwell/config.git"

# Initialize Config Repo
function init_repo () {
  mkdir -p "${config_dir}"
  git -C "${config_dir}" init --quiet
  git -C "${config_dir}" remote set-url origin "${config_remote}"
}

# Process Command
case ${1} in
  repo)
    init_repo
    ;;
  *)
    # default
    init_repo
    ;;
esac
