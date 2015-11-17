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
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'dyng/ctrlsf.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mbbill/undotree'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'vim-scripts/promela.vim'
NeoBundle 'xuhdev/vim-latex-live-preview'
NeoBundle 'lervag/vimtex'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-surround'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'MikeCoder/markdown-preview.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'szw/vim-ctrlspace'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'svermeulen/vim-easyclip'
NeoBundle 'kien/ctrlp.vim'
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" General settings 05/13/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

set nu
set relativenumber
set smartindent
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 自适应不同语言的智能缩进
" filetype indent on
filetype plugin indent on
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

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Keyboard Mapping                             "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

inoremap jj <ESC>l
inoremap kk <ESC>:w<CR>li
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" 定义快捷键到行首和行尾
" nmap lb 0
" nmap le $
" 设置快捷键将选中文本块复制至系统剪贴板
" vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
" nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
"nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
"nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
"nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
"nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
" nnoremap <Leader>nw <C-W><C-W>
" 跳转至右方的窗口
" nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
" nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
" nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
" nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
" nmap <Leader>pa %

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
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_filetype_blacklist = {}
nnoremap <leader>cjd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>cje :YcmCompleter GoToDefinition<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" color            05/13/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" basic color settings
set t_Co=256

" solarized dark
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized

" solarized light
"set background=light
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized

" molokai
"set background=dark
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai

" phd
"colorscheme phd

" desert
colorscheme desert

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin Powerline_colorscheme                 "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" 设置状态栏主题风格
"let g:Powerline_colorscheme='solarized256'

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
" Plugin nathanaelkane/vim-indent-guides       "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>ci <Plug>IndentGuidesToggle

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Code Foldering                               "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin vim-scripts/a.vim                     "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>csh :AS<CR>

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
" Replace function                             "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>rr :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin fholgado/minibufexpl.vim              "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>

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
" Plugin mbbill/undotree                       "
"             11/16/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

nnoremap <Leader>bu :UndotreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin xuhdev/vim-latex-live-preview         "
"             05/19/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let g:livepreview_previewer = 'okular'

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
" Plugin vim-ctrlspace                         "
"             11/12/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

set hidden

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugin svermeulen/vim-easyclip               "
"             11/14/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipAutoFormat = 1
"let g:EasyClipShareYanks = 1

let g:EasyClipUsePasteToggleDefaults = 0
nmap <Leader>rn <plug>EasyClipSwapPasteForward
nmap <Leader>rp <plug>EasyClipSwapPasteBackwards
