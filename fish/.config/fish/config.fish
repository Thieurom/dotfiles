# Setup `rbenv` shims path
status --is-interactive; and source (rbenv init -|psub)

# Config RubyGems
set GEM_HOME $HOME/.gem
set PATH $PATH $GEM_HOME/bin

# Config Rust
set CARGO_HOME $HOME/.cargo
set PATH $PATH $CARGO_HOME/bin

# Config Golang
set GOPATH $HOME/go
set PATH $PATH $GOPATH/bin
