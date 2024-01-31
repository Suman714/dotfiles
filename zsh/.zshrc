export EDITOR="nvim"
export VISUAL="nvim"

alias ll="ls -la"
alias ls="eza --icons"
alias tmux="tmux -u"
alias ti="tmuxnew"
alias ts="tmux-sessionizer"
alias td="tmux-new1"
alias ta="tmux a"

#vim keybinding
bindkey -v
export KEYTIMEOUT=1
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done
#using hjkl to navigate completion menu
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source "$HOME/opt/dotfiles/zsh/completion.zsh"
source "$HOME/opt/dotfiles/zsh/prompt.zsh"

if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/fzf/key-bindings.zsh 
fi

# opam configuration
[[ ! -r /home/suman/.opam/opam-init/init.zsh ]] || source /home/suman/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
