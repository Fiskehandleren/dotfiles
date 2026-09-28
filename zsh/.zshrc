#--- Zsh completions (compinit as early as possible for speed) ---
autoload -Uz compinit && compinit
#
# --- Plugins array (for oh-my-zsh plugin loader) ---
plugins=(
 git
 zsh-autosuggestions
 docker
 zsh-syntax-highlighting
 aws
 fzf-tab
 you-should-use
)


# --- Powerlevel10k instant prompt (MUST be near top) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Homebrew (before mise: mise itself is installed by brew) ---
if [[ "$OSTYPE" == "darwin"* ]]; then
 eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- mise (python/node/... version manager) ---
eval "$(mise activate zsh)"

# --- PATH and environment variables ---
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
# --- Oh My Zsh ---
source $ZSH/oh-my-zsh.sh

# export PATH="/home/asger/.local/bin:$PATH"
export PATH="/usr/local/bin/aws-connect-ec2:$PATH"
export PATH="/opt/homebrew/opt/cbc/bin:$PATH"
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT="true"
export FZF_DEFAULT_OPTS='--height=80% --preview="bat --color=always {}" --preview-window=right:60%:wrap'
export LDFLAGS="-L/opt/homebrew/opt/cbc/lib"
export CPPFLAGS="-I/opt/homebrew/opt/cbc/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/cbc/lib/pkgconfig"

# --- Aliases ---
alias v="nvim"
alias ls="eza --icons=always --all"
alias w="aerospace-windows"
export EDITOR=nvim

# --- FZF integration ---

# --- Zoxide (quick directory jumping) ---
eval "$(zoxide init --cmd cd zsh)"


# --- Powerlevel10k theme (only load one theme!) ---
source ~/.config/zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# --- Completion and fzf-tab config ---
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*:*' fzf-preview '
if [[ -d $realpath ]]; then
 eza -1 -a --color=always --icons $realpath 2>/dev/null
elif [[ -f $realpath ]]; then
 bat --color=always --style=numbers --line-range=:500 $realpath 2>/dev/null
fi'

# --- Rust (cargo) ---
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# --- Bash completions (only if you need bash-style completions for some tools) ---
# autoload -U +X bashcompinit && bashcompinit

# --- Local environment overrides ---
# . "$HOME/.local/bin/env"
# Machine-specific or sensitive settings (e.g. AWS account/instance IDs); not in dotfiles.
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

eval "$(gh completion -s zsh)"
eval "$(just --completions zsh)"

export PATH="$HOME/.local/bin:$PATH"
source <(fzf --zsh)
