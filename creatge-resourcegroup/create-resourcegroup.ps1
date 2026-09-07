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

[CmdletBinding(SupportsShouldProcess=$true)]
param (
    [Parameter(Mandatory, ParameterSetName='ByName', ValueFromPipeline=$true)]
    [ValidateLength(3, 20)]
    [string]$ResourceGroupName,
    
    [Parameter(Mandatory, ParameterSetName='ByProjectID', ValueFromPipeline=$true)]
    [int]$ProjectID,
    
    [Parameter(Mandatory=$false)]
    [hashtable]$Tags = @{Department = "IT"; Environment = "Test"}
)

$TranscriptPath = "C:\Users\student\Desktop\powershell-advanced-david\output\create-resourcegroup-transcript.txt"

Write-Verbose "Starting script and initiating transcript at $TranscriptPath"
Write-Debug "Variable `$TranscriptPath evaluated as: $TranscriptPath"
Start-Transcript -Path $TranscriptPath

if ($PSCmdlet.ParameterSetName -eq 'ByProjectID') {
    $TargetResourceGroupName = "RG-$ProjectID"
} else {
    $TargetResourceGroupName = $ResourceGroupName
}

$result = [PSCustomObject]@{    
    ResourceGroupName = $TargetResourceGroupName    
    Location          = 'centralus'    
    Status            = 'Not Created'    
    Tag               = $Tags    
    Timestamp         = Get-Date
}

try {
    Write-Host "Creating resource group: $TargetResourceGroupName"

    Write-Verbose "Attempting to create Azure Resource Group '$TargetResourceGroupName' in 'centralus'"
    Write-Debug "Executing New-AzResourceGroup cmdlet with Name: $TargetResourceGroupName and Location: centralus"
     # Task 5: Add ShouldProcess wrapper for WhatIf/Confirm support
    if ($PSCmdlet.ShouldProcess("Resource Group '$TargetResourceGroupName'", "Create")) {
        New-AzResourceGroup `
            -Name $TargetResourceGroupName `
            -Location "centralus" `
            -Tag $Tags `
            -ErrorAction Stop

        $result.Status = "Created"
        Write-Host "Resource group created successfully."
        Write-Verbose "Resource group '$TargetResourceGroupName' successfully verified and created."
    }
}
catch {
    Write-Error "Failed to create resource group: $($_.Exception.Message)"
    Write-Debug "Exception caught during resource group creation: $($_.Exception.Message)"
}
finally {
    Write-Host "Resource group operation completed."
    Write-Verbose "Stopping transcript."
    Stop-Transcript
    
    $result
}

}
