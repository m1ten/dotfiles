# Lines configured by zsh-newuser-install
HISTFILE=~/.zshhist
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/miten/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases 

alias nv='nvim'
alias snv='sudo nvim'
alias ls='exa'

# Configs
alias zshcfg='nvim ~/.zshrc'
alias pacmancfg='sudo nvim /etc/pacman.conf'
alias parucfg='sudo nvim /etc/paru.conf'
alias nvimcfg='sudo nvim ~/.config/nvim/init.vim'
alias attycfg='nvim ~/.alacritty.yml'

eval "$(starship init zsh)"
