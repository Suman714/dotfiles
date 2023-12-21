# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# vi mode 
set -o vi

export VISUAL="/usr/local/bin/nvim"
export EDITOR="$VISUAL"

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

eval "$(starship init bash)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ls="exa --icons"
alias ll="ls -la"
alias tmux="tmux -u"
alias ti="tmuxnew"
alias ts="tmux-sessionizer"
alias ta="tmux a"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/shate"

export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export OPAMROOT="$XDG_DATA_HOME/opam"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"

export PATH=$PATH:$HOME/opt/node-v20.10.0-linux-x64/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/share/go/bin
export GOPATH=$HOME/.local/share/go
export PATH=$PATH:/home/suman/.config/scripts
export PATH=$PATH:/home/suman/opt/jdk-21.0.1+12/bin
export PATH=$PATH:/home/suman/opt/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04/bin
export PATH=$PATH:/usr/local/go/bin
. "/home/suman/.local/share/cargo/env"
