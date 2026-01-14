# =========================================================
#  ZSH CONFIG — NixOS safe, old-school style
# =========================================================

# -------------------------
# Oh My Zsh
# -------------------------
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="agnosterzak"

plugins=(
  git
  archlinux
)

source "$ZSH/oh-my-zsh.sh"

# -------------------------
# Zsh plugins từ Nix store
# -------------------------

# zsh-autosuggestions
if [ -f /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting (MUST be last)
if [ -f /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# -------------------------
# Startup visuals
# -------------------------

# Fastfetch với logo Pokemon (dùng Process Substitution)
if command -v fastfetch >/dev/null 2>&1; then
    fastfetch -c "$HOME/.config/fastfetch/config-pokemon.jsonc" --logo-type file-raw --logo <(pokemon-colorscripts -r | sed '1d') --logo-padding 2
fi

# -------------------------
# Aliases
# -------------------------
if command -v lsd >/dev/null 2>&1; then
  alias ls='lsd'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'
fi

alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# -------------------------
# FZF
# -------------------------
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# -------------------------
# History
# -------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
setopt hist_ignore_dups
setopt share_history

# -------------------------
# Environment
# -------------------------
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty

# -------------------------
# Git branch in prompt
# -------------------------
git_prompt_info() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [[ -n "$branch" ]] && echo " [%F{yellow}$branch%f]"
  fi
}

setopt PROMPT_SUBST

# -------------------------
# Prompt (2 lines, classic)
# -------------------------
PROMPT='%F{blue}%~%f$(git_prompt_info)
%F{red}>%f '

# =========================================================
#  END
# =========================================================

