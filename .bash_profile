export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(rbenv init -)"
eval "$(nodenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


export PATH="$HOME/.cargo/bin:$PATH"
