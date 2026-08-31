function New-TestResourceGroup {
<#
.SYNOPSIS
Creates an Azure resource group.

.DESCRIPTION
Creates an Azure resource group in the Central US Azure region.

.PARAMETER ResourceGroupName
Specifies the name of the Azure resource group.

.EXAMPLE
.\create-resourcegroup.ps1 -ResourceGroupName "LabResources"
Creates the resource group named LabResources.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateLength(3, 20)]
    [string]$ResourceGroupName
)

$TranscriptPath = ".\create-resourcegroup-transcript.txt"

Write-Verbose "Starting script and initiating transcript at $TranscriptPath"
Write-Debug "Variable `$TranscriptPath evaluated as: $TranscriptPath"
Start-Transcript -Path $TranscriptPath

try {
    Write-Host "Creating resource group: $ResourceGroupName"

    Write-Verbose "Attempting to create Azure Resource Group '$ResourceGroupName' in 'centralus'"
    Write-Debug "Executing New-AzResourceGroup cmdlet with Name: $ResourceGroupName and Location: centralus"
    New-AzResourceGroup `
        -Name $ResourceGroupName `
        -Location "centralus" `
        -ErrorAction Stop

    Write-Host "Resource group created successfully."
    Write-Verbose "Resource group '$ResourceGroupName' successfully verified and created."
}
catch {
    Write-Error "Failed to create resource group: $($_.Exception.Message)"
    Write-Debug "Exception caught during resource group creation: $($_.Exception.Message)"
}
finally {
    Write-Host "Resource group operation completed."
    Write-Verbose "Stopping transcript."
    Stop-Transcript
}

}