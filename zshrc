source ~/path.zsh

autoload -Uz compinit && compinit
#
# Prompt
PROMPT='[%B%F{red}%2~%f%b]> '

# Rprompt with git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# VIM Mode
bindkey -v
set -o vi

# History autocompletion
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Aliases
alias ls='ls -G'
alias update_brew='brew upgrade && brew cleanup && brew cask upgrade && brew cleanup'
alias delete_cache='rm -rf ~/Library/Caches'
alias v='vim .'
alias gv='gvim .'
