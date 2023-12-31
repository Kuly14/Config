export PATH="$PATH:/Users/david/nvim/nvim-macos/bin"
export PATH=/opt/homebrew/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias c="cargo"
alias f="forge"
alias .="cd ../"
alias ..="cd ../../"
alias vim="nvim"
alias vi="nvim"
alias p="python3"

export PATH="$PATH:/Users/david/.huff/bin"

# bun completions
[ -s "/Users/david/.bun/_bun" ] && source "/Users/david/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:/Users/david/GoCore/build/bin"
export PATH="$PATH:/Users/david/.aiken/bin"
