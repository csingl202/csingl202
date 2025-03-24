<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows security event log is at least 1024000 KB (1 GB).

.NOTES
    Author          : Clyde Singleton
    GitHub          : github.com/csingl202
    Date Created    : 2025-03-23
    Last Modified   : 2025-03-23
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000505).ps1 
#>


# Define registry path and value details
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
$valueName = "MaxSize"
$valueData = 0x000fa000  # Equivalent to 1024000 in decimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Confirm the change
$updatedValue = Get-ItemProperty -Path $registryPath -Name $valueName
Write-Host "The registry value 'MaxSize' has been set to: $($updatedValue.$valueName)"
