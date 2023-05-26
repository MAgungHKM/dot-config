# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

export JAVA_HOME="/usr/local/opt/openjdk@11"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.local/bin

alias npr="npm run"
alias glo="git log --oneline"
alias jestc="npx jest -c jest.config.js --coverage=true --coverageReporters='html' --verbose=false"
alias jestc-open="open coverage/index.html"

export HISTIGNORE='*sudo -S*'

autoload -U add-zsh-hook
load-dot-node-version() {
  local node_version="$(node --version)"
  local dot_node_version_path="$(find . -name .node-version -maxdepth 1)"
  local default_node_version_path="$(find $HOME -name .node-version -maxdepth 1)"

  if [ -n "$dot_node_version_path" ]; then
    local dot_node_version=$(cat "${dot_node_version_path}")

    if [ "$dot_node_version" != "$node_version" ]; then
      sudo -S <<< "$(security find-generic-password -w -a hkm -s 'CLI Secret')" -k n $dot_node_version
    fi
  elif [ -n "$default_node_version_path" ]; then
    local default_node_version=$(cat "${default_node_version_path}")

    if [ "$node_version" != "$default_node_version" ]; then
      echo "Reverting to n default version"
      sudo -S <<< "$(security find-generic-password -w -a hkm -s 'CLI Secret')" -k n $default_node_version
    fi
  fi
}
add-zsh-hook chpwd load-dot-node-version
load-dot-node-version

eval "$(/usr/local/bin/brew shellenv)"
eval "$(rbenv init - zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
