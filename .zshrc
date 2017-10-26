###############################################################################
### .zshrc
###_* Basics ===========================================================
export ZSH=$HOME/.oh-my-zsh

ulimit -f unlimited
ulimit -u 2048

ZSH_THEME="minimal"
DISABLE_LS_COLORS="true"
plugins=(git autojump history-substring-search pass)

export GOPATH="$HOME/Documents/goroot"
export PATH="/usr/local/go/bin:$HOME/.cabal/bin:$HOME/.bin:$HOME/.bin/elixir/bin:$HOME/.cache/rebar3/bin:$PATH"
source $ZSH/oh-my-zsh.sh
source $HOME/.bin/erlang/20.0/activate

# history-substring-search options
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=bold
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=none
setopt HIST_FIND_NO_DUPS

# The next line updates PATH for the Google Cloud SDK.
#source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
#source "$HOME/google-cloud-sdk/completion.zsh.inc"

###_* Aliases ==========================================================
alias gs="git status -s"

### eof
