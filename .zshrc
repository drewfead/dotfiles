# paths and homes
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
export PATH=$JAVA_HOME/bin:$PATH

# default editor
export EDITOR=/usr/bin/vim

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

# theming and styling
## oh-my-posh theme
eval "$(oh-my-posh init zsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/M365Princess.omp.json)"
## zsh-syntax-highlighting styling
source $HOME/.zsh-syntax-highlighting-styles

# load secrets
source $HOME/.profile_secrets

# aliases
