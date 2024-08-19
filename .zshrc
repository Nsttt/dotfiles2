export EDITOR=nvim
export VISUAL=$EDITOR
export ZSH="/Users/nsttt/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
# GHCup (Haskell)
[ -f "/Users/nsttt/.ghcup/env" ] && source "/Users/nsttt/.ghcup/env" # ghcup-env
# fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Alias
function switch_aws_profile() {
    if [ -z "$1" ]; then
        echo "
    ___ _       _______    ____  ____  ____  ____________    ______   ______       ____________________  __
   /   | |     / / ___/   / __ \/ __ \/ __ \/ ____/  _/ /   / ____/  / ___/ |     / /  _/_  __/ ____/ / / /
  / /| | | /| / /\__ \   / /_/ / /_/ / / / / /_   / // /   / __/     \__ \| | /| / // /  / / / /   / /_/ / 
 / ___ | |/ |/ /___/ /  / ____/ _, _/ /_/ / __/ _/ // /___/ /___    ___/ /| |/ |/ // /  / / / /___/ __  /  
/_/  |_|__/|__//____/  /_/   /_/ |_|\____/_/   /___/_____/_____/   /____/ |__/|__/___/ /_/  \____/_/ /_/   
"

        echo "Usage: switch_aws_profile <profile_name>"
        echo "Available profiles:"
        grep -E '^\[profile ' ~/.aws/config | sed -E 's/^\[profile ([^]]+)\]$/\1/' | while read profile; do
            echo "  - $profile"
        done
        return 1
    fi

    if ! grep -q "^\[profile $1\]" ~/.aws/config; then
        echo "Profile '$1' not found."
        return 1
    fi

    export AWS_PROFILE=$1
    echo "AWS_PROFILE set to $AWS_PROFILE"
}

alias sap="switch_aws_profile"

alias cls="clear"
alias vim="nvim"
alias n="nvim"
alias lg="lazygit"

# Unalias g to use Go version manager
unalias g

# Eza Aliases
alias l='eza -l'
alias la='eza -a'
alias ll='eza -lah'
alias ls='eza --color=auto'
# Eza Aliases END

alias c="open $1 -a \"Visual Studio Code\""
alias flush-dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Servers
alias aincrad="ssh nsttt@172.27.0.1"
alias yui="ssh nsttt@172.27.0.100"
alias underworld="ssh root@172.27.0.99"

# # React native
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# Bun
export BUN_INSTALL="/Users/nsttt/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/Users/nsttt/.bun/_bun" ] && source "/Users/nsttt/.bun/_bun"

# Created by `pipx` on 2022-08-12 09:16:17
export PATH="$PATH:/Users/nsttt/.local/bin"

# pnpm
export PNPM_HOME="/Users/nsttt/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
alias pnpx='pnpm dlx'
# pnpm end


[ -s "${HOME}/.g/env" ] && \. "${HOME}/.g/env"  # g shell setup

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(starship init zsh)"
export PATH=$PATH:/Users/nsttt/.spicetify
