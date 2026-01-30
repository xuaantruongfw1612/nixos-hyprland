autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

[ -f /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /run/current-system/sw/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias g='git'
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gp='git push'
alias gl='git pull'

alias grep='grep --color=auto'

if command -v lsd >/dev/null 2>&1; then
  alias ls='lsd'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v fastfetch >/dev/null 2>&1; then
  fastfetch -c "$HOME/.config/fastfetch/config-pokemon.jsonc" --logo-type file-raw --logo <(pokemon-colorscripts -r | sed '1d') --logo-padding 2
fi

export EDITOR=nvim
export VISUAL=nvim
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt share_history
setopt hist_ignore_dups

setopt PROMPT_SUBST

my_git_info() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [[ -n "$branch" ]] && echo " [%F{yellow}$branch%f]"
  fi
}

PROMPT='%F{blue}%~%f$(my_git_info)
%F{red}>%f '
