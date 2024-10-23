@echo off
setlocal

echo Installing applications using winget...

:: Update winget
winget upgrade --all

:: List of applications to install
set "apps=GlazeWM Mozilla.Firefox Chocolatey Microsoft.PowerToys Telegram.Desktop Spotify Neovim Git NVIDIA.GeForceExperience"

for %%A in (%apps%) do (
    echo Installing %%A...
    winget install --id %%A --exact --silent
)

echo All applications have been processed.

:: Call the link.bat script from the same directory
call "%~dp0link.bat"

endlocal
pause

