export ZSH=~/.oh-my-zsh

ZSH_THEME="my_zsh_theme"

source $ZSH/oh-my-zsh.sh

#############################
#### ↓↓↓個人設定↓↓↓ ####
#############################

# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
export EDITOR=vim

# yarn
export PATH="$PATH:/opt/yarn-1.22.4/bin"

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# homebrew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications" 

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# エイリアス: git 系
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gct='git commit'
alias gg='git grep'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gcma='git checkout master'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias gmod='git merge origin/develop'
alias gmud='git merge upstream/develop'
alias gmom='git merge origin/master'
alias gcm='git commit -m'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gst='git stash'
alias gsl='git stash list'
alias gsu='git stash -u'
alias gsp='git stash pop'
 
# -------------------------------------
# zshのオプション
# -------------------------------------

## 補完機能の強化
autoload -U compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2


# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# zshでコメントを打つとbad patternと怒られるのを無視する
setopt interactivecomments

# 色を使う
setopt prompt_subst

# ^Dでログアウトしない。
setopt ignoreeof

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# タブによるファイルの順番切り替え
setopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    $path
)

# -------------------------------------
# エイリアス
# -------------------------------------

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
:elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# -------------------------------------
# キーバインド
# -------------------------------------

bindkey -e

function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
bindkey '^K' cdup

bindkey "^R" history-incremental-search-backward

# -------------------------------------
# その他
# -------------------------------------


# Flutter
export PATH=$PATH:$HOME/development/flutter/bin

# Golang3 GOPATHでの設定
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin

code () {
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

