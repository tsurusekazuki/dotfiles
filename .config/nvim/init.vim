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
  
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'sh -c "cd app && yarn install"' })

  call dein#add('lambdalisue/fern.vim')
  
  " Required:               
  call dein#end()           
  call dein#save_state()    
endif

function s:vim_python()
    " vim-lspの各種オプション設定
    let g:lsp_signs_enabled = 1
    let g:lsp_diagnostics_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_virtual_text_enabled = 1
    let g:lsp_signs_error = {'text': '✗'}
    let g:lsp_signs_warning = {'text': '‼'}
    let g:lsp_signs_information = {'text': 'i'}
    let g:lsp_signs_hint = {'text': '?'}

    if (executable('pyls'))
        " pylsの起動定義
        augroup LspPython
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': { server_info -> ['pyls'] },
                \ 'whitelist': ['python'],
                \})
        augroup END
    endif
endfunction

function s:vim_markdown()
  let g:mkdp_auto_start = 0

  let g:mkdp_auto_close = 1

  let g:mkdp_refresh_slow = 0

  let g:mkdp_command_for_global = 0

  let g:mkdp_open_to_the_world = 0

  let g:mkdp_open_ip = ''
'
  let g:mkdp_browser = ''

  let g:mkdp_echo_preview_url = 0

  let g:mkdp_browserfunc = ''

  let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {},
      \ 'content_editable': v:false,
      \ 'disable_filename': 0
      \ }

  let g:mkdp_markdown_css = ''

  let g:mkdp_highlight_css = ''

  let g:mkdp_port = ''

  let g:mkdp_page_title = '「${name}」'

  let g:mkdp_filetypes = ['markdown']
endfunction

" 関数呼び出し
call s:vim_python()
call s:vim_markdown()

" 定義ジャンプ(デフォルトのctagsによるジャンプを上書きしているのでこのあたりは好みが別れます)
nnoremap <C-]> :<C-u>LspDefinition<CR>
" 定義情報のホバー表示
nnoremap K :<C-u>LspHover<CR>
" 名前変更
nnoremap <LocalLeader>R :<C-u>LspRename<CR>
" 参照検索
" p
nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
" Lint結果をQuickFixで表示
nnoremap <LocalLeader>f :<C-u>LspDocumentDiagnostics<CR>
" テキスト整形
nnoremap <LocalLeader>s :<C-u>LspDocumentFormat<CR>
" オムニ補完を利用する場合、定義の追加
set omnifunc=lsp#complete

" Required:                  
filetype plugin indent on

" If you want to install not installed plugins on startup.    
if dein#check_install()                                       
  call dein#install()      
endif                    
