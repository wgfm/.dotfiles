#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:/home/wgfm/apps/gradle-2.4/bin:/home/wgfm/apps/idea-IC-141.1532.4/bin:/home/wgfm/apps/apache-maven-3.3.3/bin:/home/wgfm/apps/leiningen:/usr/local/heroku/bin
export MAVEN_HOME=/home/wgfm/apps/apache-maven-3.3.3/bin
alias ls='ls --color=auto'
alias maxi='ssh -Y wgfm@wgfm'
alias atp="export PATH=$PATH:`pwd`"
alias py="python3"
alias cdr='cd "$(git rev-parse --show-toplevel)"'
alias loc="find . name '*.java' 2>/dev/null | xargs wc -l 2>/dev/null | tail -n 1"
alias prj="cd ~/dev/enshore/portal"
alias web="cdr && cd src/main/webapp/WEB-INF"
alias jsrc="cdr && cd src/main/java/nl/enshore"
alias vi='vim'
alias figwheel='rlwrap lein figwheel'

function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}
function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf " [%s]" $branch; fi
}

PS1="\u@\h \[\033[0;36m\]\W\[\033[0m\]\[\033[0;32m\]\$(git-branch-prompt)\[\033[0m\] \$ "
