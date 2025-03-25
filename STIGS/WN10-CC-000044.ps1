<#
.SYNOPSIS
    This PowerShell script ensures that internet connection sharing is disabled.

.NOTES
    Author          : Clyde Singleton
    GitHub          : github.com/csingl202
    Date Created    : 2025-03-25
    Last Modified   : 2025-03-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000044
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000044).ps1 
#>

# Define registry path and key
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"
$valueName = "NC_ShowSharedAccessUI"

# Define the value to set (0x00000000 corresponds to 0, which disables the Shared Access UI)
$value = 0x00000000  # 0 disables the Shared Access UI

# Check if the registry path exists, and create it if it doesn't
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry key
Set-ItemProperty -Path $regPath -Name $valueName -Value $value -Type DWord

Write-Host "Registry key $valueName has been set to $value (Disables Shared Access UI)"
