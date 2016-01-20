"""""""""""""""""""""""""""""""""""""""""""""
"                                           "
" Neobundle 11/16/2015 added by Peidong     "
"                                           "
"""""""""""""""""""""""""""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:

 " pure vimscript plugins:
""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Base Plugins                                 "
"             11/29/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""
 NeoBundle 'Shougo/vimproc.vim', {
             \ 'build' : {
             \     'windows' : 'tools\\update-dll-mingw',
             \     'cygwin' : 'make -f make_cygwin.mak',
             \     'mac' : 'make',
             \     'linux' : 'make',
             \     'unix' : 'gmake',
             \    },
             \ }
 NeoBundle 'Shougo/vimshell.vim'
 NeoBundle 'Shougo/unite.vim'
""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Important Plugins                            "
"             11/29/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

 NeoBundle 'tomtom/tcomment_vim'
 NeoBundle 'junegunn/vim-easy-align'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'Yggdroot/indentLine'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'Xuyuanp/nerdtree-git-plugin'
 NeoBundle 'mbbill/undotree'
 NeoBundle 'easymotion/vim-easymotion'
 NeoBundle 'tpope/vim-surround'
 "Git
 NeoBundle 'airblade/vim-gitgutter'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'ntpeters/vim-better-whitespace'
 NeoBundle 'jiangmiao/auto-pairs'
 NeoBundle 'docunext/closetag.vim'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'kien/ctrlp.vim'
 "NeoBundle 'flazz/vim-colorschemes'
 NeoBundle 'NLKNguyen/papercolor-theme'
 NeoBundle 'gcmt/wildfire.vim'
 NeoBundle 'luochen1990/rainbow'
 NeoBundle 'vim-scripts/YankRing.vim'
 NeoBundle 'szw/vim-ctrlspace'
 NeoBundle 'chrisbra/vim-diff-enhanced'
 NeoBundle 'mattn/emmet-vim'
""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Lazy                                         "
"             11/29/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""
 NeoBundleLazy 'rizzatti/dash.vim'
 NeoBundleLazy 'honza/vim-snippets'
 "Markdown
 NeoBundleLazy 'tpope/vim-markdown'
 "Json
 NeoBundleLazy 'elzr/vim-json'
 "Matlab
 NeoBundleLazy 'vim-scripts/MatlabFilesEdition'
 "Javascript
 NeoBundleLazy 'pangloss/vim-javascript'
 "PHP
 NeoBundleLazy 'StanAngeloff/php.vim'
 NeoBundleLazy 'shawncplus/phpcomplete.vim'
 "Latex
 NeoBundle 'xuhdev/vim-latex-live-preview'
 NeoBundleLazy 'lervag/vimtex'
 "Python
 NeoBundleLazy 'hdima/python-syntax'
 "Emacs
 "NeoBundleLazy 'peidong/Vimacs'

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Other plugins                                "
"             11/29/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""
 NeoBundle 'Valloric/YouCompleteMe'
 NeoBundle 'dyng/ctrlsf.vim'
 NeoBundle 'vim-scripts/Vim-R-plugin'
 "NeoBundle 'SirVer/ultisnips'
 NeoBundleLazy 'MikeCoder/markdown-preview.vim'

 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              ""                                              "
" General settings 05/13/2015 added by Peidong "" General settings 05/13/2015 added by Peidong "
"                                              ""                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
"set number
set relativenumber
set smartindent
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 自适应不同语言的智能缩进
" filetype indent on
"filetype plugin indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu
" 文件在Vim之外修改过，自动重新读入
set autoread
" 代码匹配
set showmatch
set matchtime=3
"https://github.com/svermeulen/vim-easyclip#clipboard-setting
"set clipboard=unnamed
"特殊符号显示
" set listchars:tab:>-,trail:-,eol:$,nbsp:%,extends:>,precedes:<
" set list

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" General Keyboard Mapping                     "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

"inoremap jj <ESC><Right>
" 定义快捷键的前缀，即<Leader>
let mapleader="\<Space>"

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Code Foldering                               "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" color            05/13/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let current_time_hour = strftime("%H")
if current_time_hour < 18 && current_time_hour > 5
    let rainbow_background="light"
else
    let rainbow_background="dark"
endif
" basic color settings
set t_Co=256

if rainbow_background == "light"
    set background=light
    let g:airline_theme='sol'
elseif rainbow_background == "dark"
    set background=dark
    let g:airline_theme='dark'
endif

" NLKNguyen/papercolor-theme
colorscheme PaperColor

" desert
"colorscheme desert

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              ""                                              "
" Vimscript plugin 11/18/2015 added by Peidong "" Vimscript plugin 11/18/2015 added by Peidong "
"                                              ""                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin junegunn/vim-easy-align               "
"             01/11/2016 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin bling/vim-airline                     "
"             11/16/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin scrooloose/nerdtree                   "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>bf :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeDirArrows = 1

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin mbbill/undotree                       "
"             11/16/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

"nnoremap <Leader>bu :UndotreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin xuhdev/vim-latex-live-preview         "
"             05/19/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

if has("unix")
	let s:uname = system("uname")
    if s:uname == "Darwin\n"
    	" Do Mac stuff here
        let g:livepreview_previewer = 'open -a Preview'
    else
        " Do Linux stuff here
        let g:livepreview_previewer = 'okular'
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin lervag/vimtex                         "
"             05/19/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" make it work with YouCompleteMe
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
            \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
            \ ]
" This option controls whether to append a closing brace after a label or a citation has been completed.
let g:vimtex_complete_close_braces = 1

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin Xuyuanp/nerdtree-git-plugin           "
"             11/17/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin luochen1990/rainbow                   "
"             11/17/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active = 1

let rainbow_ctermfgs_lightcolors = ['DarkBlue', 'Magenta', 'Black', 'Red', 'DarkGray', 'DarkGreen', 'DarkYellow']
let rainbow_ctermfgs_darkcolors = ['lightblue', 'lightyellow', 'red', 'darkgreen', 'darkyellow', 'lightred', 'yellow', 'cyan', 'magenta', 'white']
let rainbow_guifgs_lightcolors = ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick']
let rainbow_guifgs_darkcolors = ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick']

if rainbow_background == "light"
    let g:rainbow_conf = {
                \   'guifgs': rainbow_guifgs_lightcolors,
                \   'ctermfgs': rainbow_ctermfgs_lightcolors
                \}
elseif rainbow_background == "dark"
    let g:rainbow_conf = {
                \   'guifgs': rainbow_guifgs_darkcolors,
                \   'ctermfgs': rainbow_ctermfgs_darkcolors
                \}
endif

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin vim-scripts/YankRing.vim              "
"             11/17/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let g:yankring_replace_n_pkey = '<Leader>p'
let g:yankring_replace_n_nkey = '<Leader>n'

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin peidong/Vimacs                        "
"             11/19/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

"let g:VM_CmdHeightAdj = 0
"let g:VM_NormalMetaXRemap = 0

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin scrooloose/syntastic                  "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin terryma/vim-multiple-cursors          "
"             07/14/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin vim-ctrlspace                         "
"             11/12/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

set hidden

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin Shougo/vimshell.vim                   "
"             11/20/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

if has("unix")
	let s:uname = system("uname")
    if s:uname == "Darwin\n"
    	" Do Mac stuff here
        let g:vimshell_editor_command = $VIM_APP_DIR.'/MacVim.app/Contents/MacOS/Vim --servername=VIM --remote-tab-wait-silent'
    else
        " Do Linux stuff here
    endif
endif
if executable('zsh') && filereadable(expand('~/.zsh_history'))
    " Use zsh history in vimshell/history source.
    let g:unite_source_vimshell_external_history_path =
                \ expand('~/.zsh_history')
endif

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin Shougo/unite.vim                      "
"             11/21/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let g:unite_source_history_yank_enable = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              ""                                              "
" Other plugins    11/18/2015 added by Peidong "" Other plugins    11/18/2015 added by Peidong "
"                                              ""                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" YCM Settings     05/13/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_disable_for_files_larger_than_kb = 0
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_filetype_blacklist = {}
nnoremap <leader>cjd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>cje :YcmCompleter GoToDefinition<CR>
let g:ycm_error_symbol = '✗✗'
let g:ycm_warning_symbol = '∆∆'
"let g:ycm_show_diagnostics_ui = 0

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin dyng/ctrlsf.vim                       "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>rt :CtrlSF<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin SirVer/ultisnips                      "
"             07/14/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin MikeCoder/markdown-preview.vim        "
"             11/07/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>bm :MarkdownPreview GitHub<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin hdima/python-syntax                   "
"             11/22/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let python_highlight_all = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              ""                                              "
" Other needs      11/18/2015 added by Peidong "" Other needs      11/18/2015 added by Peidong "
"                                              ""                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin StanAngeloff/php.vim                  "
"             11/18/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
