export TERMINAL=kitty
# ─────────────────────────────────────────────
# Max's Cyberpunk Zsh with Zinit & Starship
# ─────────────────────────────────────────────

# Fix colors
export TERM=xterm-256color

# ── Zinit Plugin Manager ──
source ~/.local/share/zinit/zinit.git/zinit.zsh

# ── Starship Prompt ──
eval "$(starship init zsh)"

# ── Plugins ──
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab
zinit light djui/alias-tips
zinit light rupa/z
zinit light zsh-users/zsh-completions

# ── History Settings ──
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# ── Alias Tips Keybinds ──
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Created by `pipx` on 2025-06-03 04:27:51
export PATH="$PATH:/home/max/.local/bin"
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[cursor]="bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[function]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[command]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=green,bold"

# Autosuggestions configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#90C07A,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Better command line navigation
bindkey "^[[1;5C" forward-word     # Ctrl + right arrow
bindkey "^[[1;5D" backward-word    # Ctrl + left arrow
bindkey "^[[A" history-beginning-search-backward    # Up arrow
bindkey "^[[B" history-beginning-search-forward     # Down arrow

# Custom terminal styling
zstyle ":completion:*" menu select
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# Fancy directory listings
alias ls="ls --color=auto"
alias ll="ls -lah --color=auto"
alias vs="vscodium"
# Custom keybindings for better interaction
bindkey "^[[H" beginning-of-line    # Home key
bindkey "^[[F" end-of-line          # End key
bindkey "^[[3~" delete-char         # Delete key

# Enable command correction prompts
setopt CORRECT
setopt CORRECT_ALL

# Better history searching
bindkey "^R" history-incremental-pattern-search-backward


# Enhanced color support
export TERM="xterm-256color"

# Better completion system
autoload -Uz compinit
compinit

# Directory stack navigation
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Command execution time display
PROMPT_COMMAND="timer_start"
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }timer_stop"


fastfetch
