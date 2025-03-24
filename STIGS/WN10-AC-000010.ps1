SYNOPSIS
    This PowerShell script ensures that the number of allowed bad logon attempts is equal to 3.

.NOTES
    Author          : Clyde Singleton
    GitHub          : github.com/csingl202
    Date Created    : 2025-03-23
    Last Modified   : 2025-03-23
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AC-000010).ps1 
#>
# Set the Account Lockout Threshold to 3 invalid logon attempts
$lockoutThreshold = 3

# Use 'net accounts' to configure the account lockout threshold
net accounts /lockoutthreshold:$lockoutThreshold

# Confirm the change by displaying current account settings
net accounts
