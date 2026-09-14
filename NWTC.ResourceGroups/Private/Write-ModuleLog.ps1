<#
.SYNOPSIS
    Writes structured log entries to a designated log file.
.DESCRIPTION
    Private helper function to handle logging for module functions.
.PARAMETER Message
    The log message string to append.
.PARAMETER Level
    The severity level of the log (INFO, WARN, ERROR). Defaults to INFO.
.PARAMETER LogFile
    The file path where the log entry will be written.
#>
function Write-ModuleLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message,

        [Parameter(Mandatory = $false)]
        [ValidateSet('INFO', 'WARN', 'ERROR')]
        [string]$Level = 'INFO',

        [Parameter(Mandatory = $true)]
        [string]$LogFile
    )

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $logEntry = "$timestamp [$Level] $Message"

    # Ensure output directory exists before appending
    $logDir = Split-Path -Path $LogFile -Parent
    if (-not (Test-Path -Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir -Force | Out-Null
    }

    Add-Content -Path $LogFile -Value $logEntry
}