###
# Prompt
##
autoload -U promptinit && promptinit
PURE_PROMPT_SYMBOL=""
PURE_GIT_DOWN_ARROW="↓"
PURE_GIT_UP_ARROW="↑"
prompt pure

###
# History
##
HISTZISE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export PATH="$HOME/.bin:$PATH"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

export VISUAL=nvim
export EDITOR=nvim

source ~/.config/zsh/aliases

#
autoload -U colors zsh-mime-setup select-word-style
colors
zsh-mime-setup # run everything as if it's an executable
select-word-style bash

###
# Go
##
export GOPATH=~/.development/go
export GOROOT=~/.development/go
export GOBIN=~/.development/go/bin
export PATH=$PATH:$GOROOT/bin

###
# Auto-suggestions
##
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

###
# Completion
##
fpath=(~/.config/zsh/zsh-completions/src $fpath)
autoload -U compinit
compinit
zmodload -i zsh/complist        
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete alisases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word    
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
users=(jvoisin root)           # because I don't care about others
zstyle ':completion:*' users $users
bindkey -M menuselect '^[[Z' reverse-menu-complete

###
# Generic completion with --help
##
compdef _gnu_generic gcc
compdef _gnu_generic gdb
