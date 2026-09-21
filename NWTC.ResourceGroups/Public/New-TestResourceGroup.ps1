function Get-ResourceGroupSummary {
<#
.SYNOPSIS
Retrieves a summary of Azure resource groups.

.DESCRIPTION
Queries Azure resource groups and outputs a clean summary including the Resource Group Name, Location, and Tags.

.PARAMETER ResourceGroupName
Optional parameter to filter by a specific resource group name.

.EXAMPLE
Get-ResourceGroupSummary
Retrieves a summary of all resource groups in the subscription.

.EXAMPLE
Get-ResourceGroupSummary -ResourceGroupName "LabResources"
Retrieves a summary for the specified resource group.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$false)]
    [string]$ResourceGroupName
)

begin {
    Write-Verbose "Function 'Get-ResourceGroupSummary' execution started."
}

process {
    try {
        Write-Verbose "Querying Azure resource groups..."
        
        if ($PSBoundParameters.ContainsKey('ResourceGroupName')) {
            $resourceGroups = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction Stop
        } else {
            $resourceGroups = Get-AzResourceGroup -ErrorAction Stop
        }

        foreach ($rg in $resourceGroups) {
            [PSCustomObject]@{
                ResourceGroupName = $rg.ResourceGroupName
                Location          = $rg.Location
                Tags              = $rg.Tags
            }
        }
        
        Write-Verbose "Resource group summary retrieved successfully."
    }
    catch {
        Write-Error "Failed to retrieve resource group summary: $($_.Exception.Message)"
        Write-Verbose "Error caught during retrieval: $($_.Exception.Message)"
    }
}

end {
    Write-Verbose "Function 'Get-ResourceGroupSummary' execution completed."
}
}