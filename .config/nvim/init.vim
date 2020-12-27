" encode setting                                                                                                                                 
set encoding=utf-8
" edita setting
set number                                                      " 行番号表示
set splitbelow                                                  " 水平分割時に下に表示
set splitright                                                  " 縦分割時を右に表示
set noequalalways                                               " 分割時に自動調整を無効化
set wildmenu                                                    " コマンドモードの補完
" cursorl setting
set ruler                                                       " カーソルの位置表示
set cursorline                                                  " カーソルハイライト
" tab setting
set expandtab                                                  " tabを複数のspaceに置き換え
set tabstop=2                                                   " tabは半角2文字
set shiftwidth=2                                                " tabの幅

" ------------------------------------------------------------
" dein.vim set up
" ------------------------------------------------------------
if &compatible    
  set nocompatible               " Be iMproved    
endif

" Pluginディレクトリのパス    
let s:dein_dir = expand('~/.vim/dein')
" anyenvのパス
let s:anyenv_dir = expand('~/.anyenv/envs')
" dein.vimのパス    
let s:dein_repo_dir = s:dein_dir .  '/repos/github.com/Shougo/dein.vim'    
" tomlのディレクトリへのパス    
let s:toml_dir = expand('~/.config/nvim')    
" Pythonのパス
let g:python3_host_prog = s:anyenv_dir .  '/pyenv/versions/3.8.3/bin/python3.8'
" Required:    
execute 'set runtimepath^=' . s:dein_repo_dir    

" Required:    
if dein#load_state(s:dein_dir)    
  call dein#begin(s:dein_dir)    

  " 起動時に読み込むプラグイン群のtoml    
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 利用時に読み込むプラグインのtoml
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
  "if has('python3')
   " call dein#load_toml(s:toml_dir . '/dein_python.toml', {'lazy': 1})
  "endif

  " call dein#load_toml(s:toml_dir . '/dein_frontend.toml', {'lazy': 1})

  " Required:               
  call dein#end()           
  call dein#save_state()    
endif                        

" Required:                  
filetype plugin indent on                                   

" If you want to install not installed plugins on startup.    
if dein#check_install()                                       
  call dein#install()      
endif                    
