export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  alias ls='ls -F -G'
  eval `gdircolors -b $HOME/.dir_colors`
fi

alias grep='grep -i --color=auto'
alias egrep='egrep -i --color=auto'
alias fgrep='fgrep -i --color=auto'

alias ll='ls -alFG'
alias la='ls -A --color'
alias l='ls -CF --color'

alias gpr='git pull --rebase'
alias gcm='git checkout master'
alias gcp='git checkout production'
alias gc='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gds='git diff --staged'
alias grm='git rebase master'
alias grp='git rebase production'
alias gp='git push'
alias gpf='git push -f'
alias gs='git status'
alias gsh='git show'
alias ga='git add .'
alias gca='git commit --amend --no-edit'
alias grc='git rebase --continue'
alias gclean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias gfl='git diff --name-only HEAD HEAD^'

alias less='less -R'
alias more='more -R'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo erro    r)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

g(){
  if [ -z $2 ]
  then
    ag -C 3 -i --ruby --js --sass --java --python --color-match "1;31" --color-line-number "39" $1
  elif [ $2 = "--all" ]
  then
    ag -C 3 -i --color-match "1;31" --color-line-number "39" $1
  else
    ag -C 3 -i --color-match "1;31" --color-line-number "39" $2 $1
  fi
}
source "$HOME/.cargo/env"
