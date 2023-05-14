#!/bin/false
#
# Initiaize a ZSH environment.
#

# Initialization Parameters
declare -r config_dir="${XDG_CONFIG_HOME:-${HOME}/.config}"
declare -r config_remote="git@github.com:johnsockwell/config.git"
declare -r config_init="init.zsh"
declare -r config_key="${HOME}/.ssh/com.github.johnsockwell.config"

# Initialize SSH
function init_ssh () {
  if [[ ! -e ${config_key} ]]; then
    ssh-keygen -q -t ed25519  -C "johnsockwell@users.noreply.github.com" -f "${config_key}" -N ''
  fi
  ssh-add -q "${config_key}"
}

# Initialize GitHub Access
function init_github () {
  while ssh -q git@github.com > /dev/null 2>&1; [[ $? -ne 1 ]]; do
    echo "Please add the following Deploy Key to your account..."
    cat "${config_key}.pub"
    echo "Press any key to continue..."
    read -s -k
  done
}

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
  ssh)
    init_ssh
    ;;
  github)
    init_github
    ;;
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
    init_ssh
    init_github
    init_repo
    init_worktree
    exec_init
    ;;
esac
