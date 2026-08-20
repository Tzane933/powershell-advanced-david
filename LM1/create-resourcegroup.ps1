<#
This script creates an Azure resource group. and its based in central US, and it also specifies the name of the azure resource group
#>
param (
    [Parameter(Mandatory)]
    [ValidateLength(3, 20)]
    [string]$ResourceGroupName
)

$TranscriptPath = ".\create-resourcegroup-transcript.txt"

Start-Transcript -Path $TranscriptPath

try {
    Write-Host "Creating resource group: $ResourceGroupName"

    New-AzResourceGroup `
        -Name $ResourceGroupName `
        -Location "centralus" `
        -ErrorAction Stop

    Write-Host "Resource group created successfully."
}
catch {
    Write-Error "Failed to create resource group: $($_.Exception.Message)"
}
finally {
    Write-Host "Resource group operation completed."
    Stop-Transcript
}
