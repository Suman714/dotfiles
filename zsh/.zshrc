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
_comp_options+=(globdots) # With hidden file
source "$HOME/opt/dotfiles/zsh/completion.zsh"
source "$HOME/.local/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.local/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info

# Set prompt substitution so we can use the vcs_info_message variable
setopt prompt_subst

# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info

# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true
precmd() { print "" }
PROMPT='%(?.%F{green}➜.%F{red}✗ )%f %B%F{14}%1~%f%b (${vcs_info_msg_0_}) '

if [ -x "$(command -v fzf)"  ]
then
    source /usr/share/fzf/key-bindings.zsh
fi

# opam configuration
[[ ! -r /home/suman/.opam/opam-init/init.zsh ]] || source /home/suman/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
