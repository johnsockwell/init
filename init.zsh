#!/bin/false
#
# Initiaize a ZSH environment.
#

# Initialization Parameters
declare -r config_dir="${XDG_CONFIG_HOME:-${HOME}/.config}"
declare -r config_remote="git@github.com:johnsockwell/config.git"
declare -r config_init="init.zsh"

# Initialize Config Repo
function init_repo () {
  mkdir -p "${config_dir}"
  git -C "${config_dir}" init --quiet
  git -C "${config_dir}" remote set-url origin "${config_remote}"
}

# Checkout HEAD for Initialization
function init_worktree () {
  git -C "${config_dir}" stash --quiet
  git -C "${config_dir}" fetch --quiet --depth 1 origin HEAD
  git -C "${config_dir}" checkout --quiet --detach origin/HEAD
}

# Execute Config Initialization
function exec_init () {
  zsh "${config_dir}/${config_init}"
}

# Process Command
case ${1} in
  repo)
    init_repo
    ;;
  worktree)
    init_worktree
    ;;
  execute)
    exec_init
    ;;
  *)
    # default
    init_repo
    init_worktree
    exec_init
    ;;
esac
