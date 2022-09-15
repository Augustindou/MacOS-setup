# case insensitive autocompletion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit
compinit

# starship
eval "$(starship init zsh)"

# python aliases
alias pip="pip3"
alias venv_init="python3 -m venv .venv"
alias venv="source .venv/bin/activate"

# exa
alias ls="exa"
alias ll="exa -l"
alias la="exa -a"
alias tree="exa --tree"

# bat
alias cat="bat --paging=never"

# fzf
alias fzf="fzf --height 40% --preview 'bat --color=always --style=numbers --line-range=:500 {}' | tee >(pbcopy)"

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"
alias zz="z -"