<#
.SYNOPSIS
Creates an Azure resource group.

.DESCRIPTION
Creates an Azure resource group in the Central US Azure region.

.PARAMETER ResourceGroupName
Specifies the name of the Azure resource group.

.EXAMPLE
.\create-resourcegroup.ps1 -ResourceGroupName "LabResources"
Creates a resource group named LabResources.
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