# vi mode for vi people
#fish_vi_mode

# Supress greeting
function fish_greeting
end

# 256 color in tmux
function tmux
  env TERM=xterm-256color tmux $argv
end
