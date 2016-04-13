# vi mode for vi people
#fish_vi_mode

# Supress greeting
function fish_greeting
end

set -gx PATH $HOME/.bin $PATH

# Ruby environment things
if test -d $HOME/.rbenv
  set -gx PATH $HOME/.rbenv/bin $PATH
  set -gx PATH $HOME/.rbenv/shims $PATH
  . (rbenv init -)
end

set -x GOPATH ~/projects/go

eval (python -m virtualfish)
