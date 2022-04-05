if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove intro msg
set fish_greeting

# lsd
alias ls='lsd'
alias ll='lsd -lah'
alias la='lsd -A'

# git
alias gcl='git clone'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin'
alias gt='git status'

# jdtls
# export PATH=$PATH:$HOME/.local/bin

# trash-cli
alias del='trash-put'
