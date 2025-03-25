<#
.SYNOPSIS
    This PowerShell script ensures that the display of slide shows on the lock screen is disabled.

.NOTES
    Author          : Clyde Singleton
    GitHub          : github.com/csingl202
    Date Created    : 2025-03-25
    Last Modified   : 2025-03-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000010).ps1 
#>

# Define registry path and key
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$valueName = "NoLockScreenSlideshow"

# Define the value to set (1 disables lock screen slideshow)
$value = 1  # 1 disables lock screen slideshow

# Check if the registry path exists, and create it if it doesn't
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry key
Set-ItemProperty -Path $regPath -Name $valueName -Value $value -Type DWord

Write-Host "Registry key $valueName has been set to $value (Disables Lock Screen Slideshow)"
