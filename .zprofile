# .zprofile is for login shells. It is basically the same as .zlogin except that it's sourced before .zshrc whereas .zlogin is sourced after .zshrc. According to the zsh documentation, ".zprofile is meant as an alternative to .zlogin for ksh fans; the two are not intended to be used together, although this could certainly be done if desired."
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
export PATH=$JAVA_HOME/bin:$PATH

# enable antigen for plugin management
## installed with brew install antigen
source /opt/homebrew/share/antigen/antigen.zsh

# load plugins from oh-my-zsh
antigen use oh-my-zsh

# plugins from oh-my-zsh
antigen bundle git
antigen bundle dotenv
antigen bundle brew
antigen bundle docker
antigen bundle docker-compose
antigen bundle encode64
antigen bundle extract
antigen bundle fzf
antigen bundle golang
antigen bundle node
antigen bundle pip
antigen bundle rust
antigen bundle terraform
antigen bundle yarn
antigen bundle zsh-interactive-cd

# plugins from elsewhere
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# initialize antigen
antigen apply

# aliases
source $HOME/.zshaliases
