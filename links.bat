@echo off
setlocal

:: Get the current directory
set "currentDir=%cd%"
:: Get the home directory (user profile)
set "homeDir=%USERPROFILE%"

:: List of folders and files to create symlinks for
set "items=.config .glaze-wm .ideavimrc"

for %%I in (%items%) do (
    if exist "%currentDir%\%%I" (
        if exist "%homeDir%\%%I" (
            echo Symlink for %%I already exists in %homeDir%.
        ) else (
            if exist "%currentDir%\%%I\" (
                mklink /D "%homeDir%\%%I" "%currentDir%\%%I"
                echo Created directory symlink for %%I
            ) else (
                mklink "%homeDir%\%%I" "%currentDir%\%%I"
                echo Created file symlink for %%I
            )
        )
    ) else (
        echo %%I does not exist in the current directory.
    )
)

endlocal
pause
