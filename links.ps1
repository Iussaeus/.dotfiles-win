# Get the current directory
$currentDir = Get-Location
# Get the home directory (user profile)
$homeDir = [System.Environment]::GetFolderPath('UserProfile')

# List of folders and files to create symlinks for
$items = @(".config", ".glaze-wm", ".ideavimrc", ".gitconfig")

# Create the directory if it doesn't exist
$profileDir = Split-Path $PROFILE -Parent
if (-not (Test-Path $profileDir))
{
	New-Item -ItemType Directory -Path $profileDir -Force
}

# Create the symlink for PowerShell profile
if (-not (Test-Path $PROFILE))
{
	New-Item -ItemType SymbolicLink -Path $PROFILE -Target (Join-Path $currentDir "profile.ps1") -Force
	Write-Host "Created symlink for PowerShell profile"
} else
{
	Write-Host "Symlink for PowerShell profile already exists."
}

foreach ($item in $items)
{
	$currentItemPath = Join-Path $currentDir $item
	$homeItemPath = Join-Path $homeDir $item
    
	if (Test-Path $currentItemPath)
	{
		if (Test-Path $homeItemPath)
		{
			Write-Host "Symlink for $item already exists in $homeDir."
		} else
		{
			if (Test-Path "$currentItemPath\")
			{
				New-Item -ItemType SymbolicLink -Path $homeItemPath -Target $currentItemPath -Force
				Write-Host "Created directory symlink for $item"
			} else
			{
				New-Item -ItemType SymbolicLink -Path $homeItemPath -Target $currentItemPath -Force
				Write-Host "Created file symlink for $item"
			}
		}
	} else
	{
		Write-Host "$item does not exist in the current directory."
	}
}

Pause

