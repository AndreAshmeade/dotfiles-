# Created by andre ashmeade 


ZSH_THEME="3den"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='red'
# POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='blue'

# Options for setting colors to directories.

# POWERLEVEL9K_DIR_HOME_BACKGROUND=red
# POWERLEVEL9K_DIR_HOME_FOREGROUND=white
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=red
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=white
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=yellow
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND=black
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=red
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=white

# Load Nerd Fonts with Powerlevel9k theme for Zsh
POWERLEVEL9K_MODE='nerdfont-complete'
source  ~/Spaces/Editor-Settings/powerlevel9k/powerlevel9k.zsh-theme

HOMEBREW_FOLDER="/usr/local/share"
source "$HOMEBREW_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_FOLDER/zsh-history-substring-search/zsh-history-substring-search.zsh"

autoload -Uz compinit;
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

#History setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZ

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion

#Plugins setup
source <(antibody init)
antibody bundle zdharma/fast-syntax-highlighting > ~/.zshrc.log
antibody bundle zsh-users/zsh-autosuggestions > ~/.zshrc.log
antibody bundle zsh-users/zsh-history-substring-search > ~/.zshrc.log
antibody bundle zsh-users/zsh-completions > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/heroku > ~/.zshrc.log
antibody bundle robbyrussell/oh-my-zsh path:plugins/node > ~/.zshrc.log
antibody bundle robbyrussell/oh-my-zsh path:plugins/web-search > ~/.zshrc.log
antibody bundle robbyrussell/oh-my-zsh path:plugins/sudo > ~/.zshrc.log
antibody bundle robbyrussell/oh-my-zsh path:plugins/react-native > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/kubectl > ~/.zshrc.log
# antibody bundle robbyrussell/oh-my-zsh path:plugins/npm > ~/.zshrc.log
antibody bundle JamesKovacs/zsh_completions_mongodb > ~/.zshrc.log

autoload -Uz compinit;compinit -i

# Aliases

alias grep=ack
alias digitalocean="ssh digitalocean"
alias ls="colorls"
alias python="python3"
alias pip="pip3"
alias easy-install="easy_install-3.7"
alias config="vi $HOME/.zshrc"
alias projects="cd $HOME/Spaces/Projects"
alias reload="source $HOME/.zshrc"

# Git aliases
alias gi="git init"
alias gs="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias ga="git add ."
alias gcm="git commit -m"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg='git log --graph --oneline --decorate --all'

export PATH="/usr/local/opt/libpcap/bin:$PATH"

fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# Misc
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Tab title
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# Create a new react app

react-app() {
  npx create-react-app $1
  cd $1
  npm i -D eslint
  npm i -D eslint-config-prettier eslint-plugin-prettier
  npm i -D eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-hooks
  cp "${HOME}/.eslintrc.json" .
  cp "${HOME}/.prettierrc" .
  echo $1 > README.md
  rm -rf yarn.lock
  cd src
  rm -f App.css App.test.js index.css logo.svg serviceWorker.js
  mkdir components views 
  git add -A
  git commit -m "Initial commit."
  cd ..
  clear
  code .
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

