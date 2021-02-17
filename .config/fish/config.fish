#############################
#### ↓↓↓個人設定↓↓↓ ####
#############################

# -------------------------------------
# 環境変数
# -------------------------------------
export LSCOLORS=gxfxcxdxbxegedabagacad

set -x PATH ~/bin $PATH 

# yarn
# set -x PATH /opt/yarn-1.22.4/bin $PATH

# anyenv
set -Ux PATH $HOME/.anyenv/bin $PATH
eval (anyenv init - | source)

# エイリアス: git 系
alias g 'git'
# Flutter
# set -x PATH $HOME/development/flutter/bin $PATH

# Golang3 GOPATHでの設定
# set -x GOPATH $HOME/go
# set -x PATH $GOPATH/bin $PATH

# Rust
# set -x PATH $HOME/.cargo/bin $PATH


