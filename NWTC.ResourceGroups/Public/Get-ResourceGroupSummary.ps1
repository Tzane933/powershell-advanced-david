function Get-ResourceGroupSummary {
    <#
    .SYNOPSIS
    Retrieves a summary of Azure resource groups.

    .DESCRIPTION
    Gets all or a specific Azure resource group and returns a summary containing the Resource Group Name, Location, and Tags.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [string]$ResourceGroupName
    )

    process {
        if ($PSBoundParameters.ContainsKey('ResourceGroupName')) {
            $rgs = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
        } else {
            $rgs = Get-AzResourceGroup
        }

        foreach ($rg in $rgs) {
            [PSCustomObject]@{
                ResourceGroupName = $rg.ResourceGroupName
                Location          = $rg.Location
                Tags              = $rg.Tags
            }
        }
    }
}