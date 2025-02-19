alias py3="python3"
alias myip4="dig +short txt ch whoami.cloudflare @1.0.0.1 | tr -d '\"'"

ZSH_UTILS="$HOME/.zsh-utils"

[ ! -d "$ZSH_UTILS" ] && mkdir -p $ZSH_UTILS

# Check if inside a tmux session
if [ -n "$TMUX" ]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi


bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -r "^[N"
bindkey -r "^[n"
bindkey -r "^[P"
bindkey -r "^[p"

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

install_util() {
  if ! command -v $1 > /dev/null 2>&1; then
    echo "Installing $1..."
    brew install $1
  fi
}

# set up fzf
install_util fzf
install_util tree
install_util bat
alias fzfp="fzf --preview 'bat -n --color=always {}'"
export FZF_DEFAULT_OPTS="--tmux bottom,40% --layout reverse --border --info=inline"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'"
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
source <(fzf --zsh)

if [ ! -d "$ZSH_UTILS/fzf-git.sh" ]; then
  git clone git@github.com:junegunn/fzf-git.sh.git "$ZSH_UTILS/fzf-git.sh"
fi
source "$ZSH_UTILS/fzf-git.sh/fzf-git.sh"

# set up zoxide
install_util zoxide
eval "$(zoxide init zsh)"

