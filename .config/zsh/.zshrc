alias nv=~/Downloads/nvim-macos/bin/nvim
eval "$(starship init zsh)"

export PATH=/Library/PostgreSQL/15/bin:$PATH
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
eval "$(zoxide init bash)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh

