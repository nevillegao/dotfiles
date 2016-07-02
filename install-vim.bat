@ECHO off

REM Clean up
SET info_dir="%USERPROFILE%\.vim"
IF EXIST "%info_dir%" (
    IF NOT EXIST "%info_dir%\" (
        DEL /F /Q "%info_dir%"
    )
)
FOR %%i IN (undo netrw) DO (
    IF EXIST "%info_dir%\%%i" (
        IF NOT EXIST "%info_dir%\%%i\" (
            DEL /F /Q "%info_dir%\%%i"
            MKDIR "%info_dir%\%%i"
        )
    ) ELSE (
        MKDIR "%info_dir%\%%i"
    )
)

REM Install rcfiles
COPY /Y vimrc "%USERPROFILE%\.vimrc"
COPY /Y gvimrc "%USERPROFILE%\.gvimrc"
XCOPY /E /I /Y vim.d "%USERPROFILE%\.vim.d"

REM Install 'Vundle'
SET bundle_dir="%USERPROFILE%\.vim.d\bundle"
RMDIR /S /Q "%bundle_dir%"
git clone https://github.com/VundleVim/Vundle.vim "%bundle_dir%\Vundle.vim"

REM Install plugins
vim +PluginInstall +qall
