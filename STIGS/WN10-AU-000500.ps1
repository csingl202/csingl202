<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Clyde Singleton
    GitHub          : github.com/csingl202
    Date Created    : 2025-03-22
    Last Modified   : 2025-03-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

 
# Define the registry key and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$regName = "MaxSize"
$regValue = 0x00008000  # The value for MaxSize (in DWORD format)

# Check if the registry path exists, and create it if not
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue

Write-Host "Registry value set successfully."
