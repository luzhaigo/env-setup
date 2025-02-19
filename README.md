# Env Setup

This script configures a Zsh environment with useful utilities like `fzf`, `zoxide`, and `bat`.  
It also includes convenient aliases, key bindings, and tmux-aware terminal settings.

## **Installation**

### **1. Clone the repository**

Run the following command to download the setup script:

```sh
ZSH_UTILS="$HOME/.zsh-utils"

[ ! -d "$ZSH_UTILS" ] && mkdir -p "$ZSH_UTILS"

if [ ! -d "$ZSH_UTILS/env-setup" ]; then
  git clone git@github.com:luzhaigo/env-setup.git "$ZSH_UTILS/env-setup"
fi
```

### **2. Source the script**

To apply the environment setup, add this line to your ~/.zshrc:

```sh
source "$HOME/.zsh-utils/env-setup/env-setup.sh"
```
