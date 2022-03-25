if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove intro msg
set fish_greeting

# ls
alias ll='ls -lah'
alias la='ls -A'

# git
alias gcl='git clone'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin'
alias gt='git status'

# jdtls
# export PATH=$PATH:$HOME/.local/bin

# lofi
alias lofi='mpv --no-video --msg-level=ffmpeg=no "https://www.youtube.com/watch?v=5qap5aO4i9A"'

