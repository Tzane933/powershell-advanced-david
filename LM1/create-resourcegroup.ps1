<#

This creates an Azure resource group.


This creates an Azure resource group in the Central US Azure region.


This specifies the name of the Azure resource group.

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