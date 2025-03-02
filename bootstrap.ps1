Write-Host "Installing applications using winget..."

winget upgrade --all
sudo winget source remove msstore

$apps = @(
	"glzr-io.glazewm",
	"Mozilla.Firefox",
	"Chocolatey.Chocolatey",
	"Microsoft.PowerToys",
	"64Gram.64Gram",
	"Spotify.Spotify",
	"Neovim.Neovim",
	"Fastfetch-cli.Fastfetch",
	"GitHub.cli",
	"JetBrains.Rider",
	"qBittorrent.qBittorrent"
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
