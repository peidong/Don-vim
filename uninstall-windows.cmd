@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_PATH=%HOME%\.vim

DEL /F /S /Q "%HOME%\.vimrc"
DEL /F /S /Q "%HOME%\.gvimrc"
DEL /F /S /Q "%HOME%\_vimrc"
DEL /F /S /Q "%HOME%\.vimrc.before"
DEL /F /S /Q "%HOME%\.vimrc.before.local"
DEL /F /S /Q "%HOME%\.vimrc.local"

RMDIR /S /Q "%HOME%\.vim"
