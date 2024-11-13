alias nv=/opt/homebrew/bin/nvim
eval "$(starship init zsh)"
export NVM_DIR=/Users/paulo.choi/.config/nvm

source /
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/Library/PostgreSQL/15/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
eval "$(zoxide init bash)"
#
# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# function zvm_config() {
#   ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# }
#
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(zsh-fzf-history-search git sudo web-search copyfile copybuffer dirhistory history jsontools macos vi-mode)
source $ZSH/oh-my-zsh.sh

bindkey -M viins 'jk' vi-cmd-mode
bindkey '^[^?' backward-kill-word
VI_MODE_SET_CURSOR=true

if [[ -f /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh ]]; then
    source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
elif [[ -f /usr/local/share/zsh-abbr/zsh-abbr.zsh ]]; then
    source /usr/local/share/zsh-abbr/zsh-abbr.zsh
fi

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
