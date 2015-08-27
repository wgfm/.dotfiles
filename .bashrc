#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias vi='vim'

export PATH=$PATH:~/apps/lein:/home/wgfm/apps/eclipse:/home/wgfm/apps/gradle-2.6/bin
PS1='[\u@\h \W]\$ '
