Write-Host "Installing applications using winget..."

winget upgrade --all

$apps = @(
	"GlazeWM",
	"Mozilla.Firefox",
	"Chocolatey",
	"Microsoft.PowerToys",
	"Telegram.Desktop",
	"Spotify",
	"Neovim",
	"Git",
	"NVIDIA.GeForceExperience",
	"neofetch-win"
)

foreach ($app in $apps)
{
	Write-Host "Installing $app..."
	winget install --id $app --exact --silent
}

Write-Host "All applications have been processed."

$scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "link.ps1"
if (Test-Path $scriptPath)
{
	& $scriptPath
} else
{
	Write-Host "link.ps1 not found in the script directory."
}

Pause
