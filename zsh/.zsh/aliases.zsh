alias vi='nvim'

alias ga='git add'
alias gb='git branch'
alias gbc='git rev-parse --abbrev-ref HEAD'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias grb='git rebase'
alias gst='git status'

alias root='cd $(git rev-parse --show-toplevel)'

alias t='tmux'

alias kctx='kubectx'
alias kx='kubectx'
alias kc='kubectl'

alias ls='ls --color=auto'

alias gcp='gcloud auth login --update-adc'

# Push this branch to a remote, if it exists. Opens up a browser for a new
# Merge Request. Tested with GitLab and MacOS only.
function gpthis() {
  remote="${1:-origin}"
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  url=$(git push -u $remote $current_branch 2>&1 | tee /dev/tty | grep https | awk '{print $2}')
  open "$url"
}

# Switch or attach tmux sessions, depending on whether the current tty has an
# open tmux session or not.
function tmux_switch() {
  if [[ "$TERM" =~ "^screen" ]] && [ -n "$TMUX" ]; then
    tmux switch-client -t $1
  else
    tmux a -t $1
  fi
}

# Create a new tmux session based on the name of the current directory. If a
# tmux session with this name already exists, this function will swap to that
# directory.
function tn() {
  local curdir=${$(pwd)##*/}
  echo $curdir

  tmux has-session -t $curdir 2>/dev/null
  if [ $? != 0 ]; then
    tmux new -s $curdir
  else
    tmux_switch $curdir
  fi
}

# Interactively switch between tmux sessions. Requires fzf.
function ts() {
  local workspace=$(tmux ls | fzf | cut -d ':' -f 1)
  if [ -z "$workspace" ]; then
    return 1
  fi

  tmux_switch $workspace
}

function mkcd() {
  mkdir -p $1
  cd $1
}
