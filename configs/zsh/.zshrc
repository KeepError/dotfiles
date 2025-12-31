# Check for macOS (Apple Silicon) Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
# Check for Linux Homebrew
elif [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# -------------------------------------------------------------------
# Starship
# -------------------------------------------------------------------

eval "$(starship init zsh)"


# -------------------------------------------------------------------
# zoxide
# -------------------------------------------------------------------

eval "$(zoxide init zsh)"


# -------------------------------------------------------------------
# fzf
# -------------------------------------------------------------------

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)


# -------------------------------------------------------------------
# mise
# -------------------------------------------------------------------

eval "$(mise activate zsh)"


# -------------------------------------------------------------------
# yazi
# -------------------------------------------------------------------

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


# -------------------------------------------------------------------
# Brew Shell Completion
# -------------------------------------------------------------------

autoload -Uz compinit
compinit
