# .zshenv is always sourced. It often contains exported variables that should be available to other programs. For example, $PATH, $EDITOR, and $PAGER are often set in .zshenv. Also, you can set $ZDOTDIR in .zshenv to specify an alternative location for the rest of your zsh configuration.

# paths and homes
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# default editor
export EDITOR=/usr/bin/vim

# load secrets
source $HOME/.zshsecrets

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
