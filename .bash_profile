export PATH=$PATH:/usr/local/sbin
alias ls='ls -G'
alias ll='ls -oh'
alias la='ls -altrh'
alias dc='docker-compose'
alias locj="find . -name "*.java" | xargs wc -l | tail -1 | awk '{print $1}'"

# Use `docker-cleanup --dry-run` to see what would be deleted.

function docker-cleanup {
EXITED=$(docker ps -q -f status=exited)
DANGLING=$(docker images -q -f "dangling=true")

if [ "$1" == "--dry-run" ]; then
  echo "==> Would stop containers:"
  echo $EXITED
  echo "==> And images:"
  echo $DANGLING
else
  if [ -n "$EXITED" ]; then
    docker rm $EXITED
  else
    echo "No containers to remove."
  fi
  if [ -n "$DANGLING" ]; then
    docker rmi $DANGLING
  else
    echo "No images to remove."
  fi
fi
}

function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}
function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf " [%s]" $branch; fi
}

PS1="\u@\h \[\033[0;36m\]\W\[\033[0m\]\[\033[0;32m\]\$(git-branch-prompt)\[\033[0m\] \$ "
