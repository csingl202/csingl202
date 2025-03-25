<#
.SYNOPSIS
    This PowerShell script ensures that convenience PIN for Windows 10 is disabled.

.NOTES
    Author          : Clyde Singleton
    GitHub          : github.com/csingl202
    Date Created    : 2025-03-25
    Last Modified   : 2025-03-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000370).ps1 
#>

# Define registry path and key
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\System"
$valueName = "AllowDomainPINLogon"

# Define the value to set (0 disables Domain PIN Logon)
$value = 0  # 0 disables Domain PIN Logon

# Check if the registry path exists, and create it if it doesn't
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry key
Set-ItemProperty -Path $regPath -Name $valueName -Value $value -Type DWord

Write-Host "Registry key $valueName has been set to $value (Disables Domain PIN Logon)"
