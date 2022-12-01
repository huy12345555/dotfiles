# Remove intro message
set fish_greeting

# lsd
alias ls='lsd'
alias ll='lsd -lah'
alias la='lsd -a'

# git
alias gi='git init'
alias gt='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias gpl='git pull'
alias gcl='git clone'
alias gsw='git switch -c'
alias gch='git checkout'
alias gm='git merge'
alias gmo='git merge -s ours'

# trash-cli
alias del='trash-put'
alias sdel='sudo trash-put'

# bat
alias bat='bat --theme Dracula'

# LunarVim
set PATH /home/giatrung2012/.local/bin $PATH

# WARP CLI
alias warp-on='sudo systemctl start warp-svc.service && warp-cli connect'
alias warp-off='warp-cli disconnect && sudo systemctl stop warp-svc.service'
alias warp-reset='warp-cli disconnect && warp-cli connect'
alias warp-status='warp-cli status'

