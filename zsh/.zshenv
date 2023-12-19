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
export ZDOTDIR="$HOME"/.config/zsh

export PATH="$HOME/opt/node-v20.10.0-linux-x64/bin:$PATH"
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/share/go/bin
export GOPATH=$HOME/.local/share/go
export PATH="/home/suman/.config/scripts:$PATH"
export PATH="/home/suman/opt/jdk-21.0.1+12/bin:$PATH"
export PATH="/home/suman/opt/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
. "/home/suman/.local/share/cargo/env"
