###############################################################################
### .zshrc
###_* Basics ===========================================================
export ZSH=$HOME/.oh-my-zsh

ulimit -n 65536 65536
ulimit -f unlimited
ulimit -u 2048

ZSH_THEME="minimal"
DISABLE_LS_COLORS="true"
plugins=(git osx pass)

export GOPATH="$HOME/Documents/goroot"
export PATH="$HOME/.cabal/bin:$HOME/.bin:$PATH"
source $ZSH/oh-my-zsh.sh

# The next line updates PATH for the Google Cloud SDK.
#source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
#source "$HOME/google-cloud-sdk/completion.zsh.inc"

###_* Aliases ==========================================================
alias gs="git status -s"

### eof
