set -gx TERM xterm-256color

# Check for macOS (Apple Silicon) Homebrew
if test -f /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
# Check for Linux Homebrew
else if test -f /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

# Vi mode
fish_vi_key_bindings

# Starship setup
starship init fish | source

# zoxide setup
zoxide init fish | source

# fzf setup
fzf --fish | source
set -x XDG_CONFIG_HOME $HOME/.config
