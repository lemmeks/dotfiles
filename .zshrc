# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/carson/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ts="tig status"
alias mformat="mix format"
alias mxt="MIX_TEST=test mix test"

prompt_context () { }
prompt_dir() {
  prompt_segment blue black "${PWD##*/}"
}
# gets csv header and turns it into a BQ schema json
alias csvToBqSchema="tr -d '\r\n|\r|\n' | sed 's/[^,]*/  {"name": \0}/g' | sed 's/,/,\n/g' | sed '1 s/^/[\n/' | sed '$ s/$/\n]/' | xclip"
# python alias for ubuntu 20.04 (the cmd python doesn't exist by default)
alias python=python3

# remove and link the given s3cfg file name
function s3cfg () {
  if [[ -f ~/.s3cfg_$1 ]]
  then
    mv ~/.s3cfg ~/.s3cfg.old
    ln -s ~/.s3cfg_$1 ~/.s3cfg
  else
    echo "~/.s3cfg_$1 does not exist"
  fi
}

# erlang / umbrella build variables
# KERL flags, when building erlang
export KERL_INSTALL_HTMLDOCS=yes
export KERL_INSTALL_MANPAGES=yes
export KERL_BUILD_DOCS=yes

# Shell history in Erlang/Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Rust / umbrella
export PATH="$PATH:$HOME/.cargo/bin"

#PATH=/usr/local/pgsql/bin:$PATH
#export PATH
. $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

# pip
# export PATH=~/.local/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/carson/.sdkman"
[[ -s "/home/carson/.sdkman/bin/sdkman-init.sh" ]] && source "/home/carson/.sdkman/bin/sdkman-init.sh"
eval "$(direnv hook zsh)"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
# disable deprecation warning
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="$HOME/bin:$PATH"
