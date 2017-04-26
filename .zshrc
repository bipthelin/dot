###############################################################################
### .zshrc
###_* Basics ===========================================================
export ZSH=$HOME/.oh-my-zsh

ulimit -f unlimited
ulimit -u 2048

ZSH_THEME="minimal"
DISABLE_LS_COLORS="true"
plugins=(git osx pass)

export GOPATH="$HOME/Documents/goroot"
export PATH="/usr/local/go/bin:$HOME/.cabal/bin:$HOME/.bin:$HOME/.bin/elixir/bin:$HOME/.cache/rebar3/bin:$PATH"
source $ZSH/oh-my-zsh.sh
source $HOME/.bin/erlang/19.2/activate

# The next line updates PATH for the Google Cloud SDK.
#source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
#source "$HOME/google-cloud-sdk/completion.zsh.inc"

###_* Aliases ==========================================================
alias gs="git status -s"

### eof
