###############################################################################
### .zshrc
###_* Basics ===========================================================
export ZSH=$HOME/.oh-my-zsh

ulimit -n 65536 65536
ulimit -u 2048
export JAVA_HOME=$(/usr/libexec/java_home)

ZSH_THEME="robbyrussell"
DISABLE_LS_COLORS="true"
plugins=(git osx pass)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:$HOME/.bin:$HOME/Library/Haskell/bin:$PATH"
source $ZSH/oh-my-zsh.sh

### eof
