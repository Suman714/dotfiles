export EDITOR="nvim"
export VISUAL="nvim"

alias ll="ls -la"
alias ls="exa --icons"
alias tmux="tmux -u"
alias ti="tmuxnew"
alias ts="tmux-sessionizer"
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

# Use modern completion system
autoload -Uz compinit
compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
_comp_options+=(globdots) # With hidden file
source "$HOME/opt/dotfiles/zsh/completion.zsh"
source "$HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/etc/zsh_command_not_found"
export HISTFILE="$XDG_STATE_HOME"/zsh/history

eval "$(starship init zsh)"

if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/doc/fzf/examples/key-bindings.zsh 
fi

# opam configuration
[[ ! -r /home/suman/.opam/opam-init/init.zsh ]] || source /home/suman/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
