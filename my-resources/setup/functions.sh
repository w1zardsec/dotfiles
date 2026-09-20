LOG_FILE="/tmp/setup_log.txt"

# Root my-resources PATH
MY_ROOT_PATH="/opt/my-resources"

# Setup directory for user customization
MY_SETUP_PATH="$MY_ROOT_PATH/setup"

function install_starship() {
  echo "[*] Installing Starship"

  if ! command -v starship >/dev/null 2>&1; then
    curl -fsSL https://starship.rs/install.sh -o /tmp/starship-install.sh
    sh /tmp/starship-install.sh -f
    rm -f /tmp/starship-install.sh
  fi

  mkdir -p "$HOME/.config"
  cp "$MY_SETUP_PATH/zsh/starship.toml" "$HOME/.config/starship.toml"

  # Removing the Exegol hook since Starship is taking care of the prompt
  sed -i -e 's/add-zsh-hook precmd update_prompt/#add-zsh-hook precmd update_prompt/g' "$HOME/.zshrc"
}
