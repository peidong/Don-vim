@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_PATH=%HOME%\.vim

IF NOT EXIST "%APP_PATH%" (
    echo backing up existing vim config
    @set today=%DATE%
    @if exist "%HOME%\.vim" call xcopy /s/e/h/y/r/q/i "%HOME%\.vim" "%HOME%\.vim.%today%"
    @if exist "%HOME%\.vimrc" call copy "%HOME%\.vimrc" "%HOME%\.vimrc.%today%"
    @if exist "%HOME%\.vimrc.before" call copy "%HOME%\.vimrc.before" "%HOME%\.vimrc.before.%today%"
    @if exist "%HOME%\.vimrc.before.local" call copy "%HOME%\.vimrc.before.local" "%HOME%\.vimrc.before.local.%today%"
    @if exist "%HOME%\.vimrc.local" call copy "%HOME%\.vimrc.local" "%HOME%\.vimrc.local.%today%"
    @if exist "%HOME%\_vimrc" call copy "%HOME%\_vimrc" "%HOME%\_vimrc.%today%"
    @if exist "%HOME%\.gvimrc" call copy "%HOME%\.gvimrc" "%HOME%\.gvimrc.%today%"
    echo cloning Don-vim
    call git clone -b master https://github.com/peidong/Don-vim.git "%APP_PATH%"
    call cd "%HOME%"
 )ELSE (
     @set ORIGINAL_DIR=%CD%
     echo updating Don-vim
     chdir /d "%APP_PATH%"
     call git pull
     chdir /d "%ORIGINAL_DIR%"
     call cd "%HOME%"
     )

 IF NOT EXIST "%HOME%\.vim\bundle" (
  call mkdir "%HOME%\.vim\bundle"
 )

 IF NOT EXIST "%HOME%/.vim/bundle/neobundle.vim" (
  call git clone https://github.com/Shougo/neobundle.vim "%HOME%/.vim/bundle/neobundle.vim"
 ) ELSE (
     call cd "%HOME%/.vim/bundle/neobundle.vim"
     call git pull
     call cd %HOME%
     )

 call vim +NeoBundleUpdate +qall

 call cd "%APP_PATH%\bundle\vimproc.vim\lib"
 call curl -OL https://github.com/Shougo/vimproc.vim/releases/download/ver.9.2/vimproc_win32.dll
 call curl -OL https://github.com/Shougo/vimproc.vim/releases/download/ver.9.2/vimproc_win64.dll
