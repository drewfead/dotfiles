# .zshrc is for interactive shells. You set options for the interactive shell there with the setopt and unsetopt commands. You can also load shell modules, set your history options, change your prompt, set up zle and completion, et cetera. You also set any variables that are only used in the interactive shell (e.g. $LS_COLORS).

# theming and styling
## oh-my-posh theme
eval "$(oh-my-posh init zsh --config ${POSH_CONFIG:-~/config.omp.json})"
## zsh-syntax-highlighting styling
source $HOME/.zsh-syntax-highlighting-styles
