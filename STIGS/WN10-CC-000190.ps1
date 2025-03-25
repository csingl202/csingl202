<#
.SYNOPSIS
    This PowerShell script ensures that Autoplay is disabled for all drives.

.NOTES
    Author          : Clyde Singleton
    GitHub          : github.com/csingl202
    Date Created    : 2025-03-25
    Last Modified   : 2025-03-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000190).ps1 
#>

# Define registry path and key
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer"
$valueName = "NoDriveTypeAutoRun"

# Define the value to set (0x000000ff corresponds to 255, which disables AutoRun for all drives)
$value = 0x000000ff  # 255 disables AutoRun for all drives

# Check if the registry path exists, and create it if it doesn't
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry key
Set-ItemProperty -Path $regPath -Name $valueName -Value $value -Type DWord

Write-Host "Registry key $valueName has been set to $value (0x000000ff)"
