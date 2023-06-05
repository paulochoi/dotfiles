alias nv=~/Downloads/nvim-macos/bin/nvim
eval "$(starship init zsh)"
export NVM_DIR=/Users/paulo.choi/.config/nvm

source /
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/Library/PostgreSQL/15/bin:$PATH
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
eval "$(zoxide init bash)"

source ~/Documents/zshplugins/zsh-snap/znap.zsh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-fzf-history-search git zsh-autosuggestions zsh-syntax-highlighting sudo web-search copyfile copybuffer dirhistory history jsontools macos)

source $ZSH/oh-my-zsh.sh

if [[ -f /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh ]]; then
    source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
elif [[ -f /usr/local/share/zsh-abbr/zsh-abbr.zsh ]]; then
    source /usr/local/share/zsh-abbr/zsh-abbr.zsh
fi
# depending on your env this may differ
# source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
# source /usr/local/share/zsh-abbr/zsh-abbr.zsh
