if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

if test -x /opt/homebrew/bin/mise
    /opt/homebrew/bin/mise activate fish | source
end

for dir in \
    $HOME/.asdf/shims \
    $HOME/go/bin \
    $HOME/.bin \
    $HOME/.local/share/mise/shims \
    $HOME/.local/bin
    if test -d $dir
        if set -l index (contains -i -- $dir $PATH)
            set -e PATH[$index]
        end
        set -gx PATH $dir $PATH
    end
end

set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"
