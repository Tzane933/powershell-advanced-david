function New-TestResourceGroup {
<#
.SYNOPSIS
Creates an Azure resource group.

.DESCRIPTION
Creates an Azure resource group in the Central US Azure region with robust parameter sets, verbose logging, and execution statistics.

.PARAMETER ResourceGroupName
Specifies the name of the Azure resource group (used with the ByName parameter set).

.PARAMETER ProjectID
Specifies the numerical project ID, automatically prefixed with "RG-" (used with the ByProjectID parameter set).

.EXAMPLE
.\create-resourcegroup.ps1 -ResourceGroupName "LabResources"
Creates the resource group named LabResources.

.EXAMPLE
1001 | New-TestResourceGroup -WhatIf
Simulates creating an Azure resource group using pipeline input for ProjectID.
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

begin {
    Write-Verbose "Function 'New-TestResourceGroup' execution started."

    # Set up log file path relative to Public folder ($PSScriptRoot\..\Logs)
    $script:LogFilePath = "$PSScriptRoot\..\Logs\New-TestResourceGroup-Log-$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"

    # Replaced Start-Transcript with Write-ModuleLog
    Write-ModuleLog -Message "Starting the creation of Resource Group..." -Level INFO -LogFile $script:LogFilePath
    
    # Task 6 Counters
    $script:totalProcessed = 0
    $script:totalCreated = 0
    $script:totalSkipped = 0
    $script:totalErrors = 0
}

process {
    $script:totalProcessed++
    Write-Verbose "Parameter validation passed successfully for active parameter set: $($PSCmdlet.ParameterSetName)."

    if ($PSCmdlet.ParameterSetName -eq 'ByProjectID') {
        $TargetResourceGroupName = "RG-$ProjectID"
        Write-ModuleLog -Message "Creating Resource Group based on ProjectID: $ProjectID" -Level INFO -LogFile $script:LogFilePath
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
        Write-Verbose "Attempting to create Azure Resource Group '$TargetResourceGroupName' in region 'centralus'."
        
        # Check ShouldProcess (handles WhatIf / Confirm)
        if ($PSCmdlet.ShouldProcess("Resource Group '$TargetResourceGroupName'", "Create")) {
            Write-ModuleLog -Message "Creating Resource Group '$TargetResourceGroupName' in 'centralus'" -Level INFO -LogFile $script:LogFilePath

            New-AzResourceGroup `
                -Name $TargetResourceGroupName `
                -Location "centralus" `
                -Tag $Tags `
                -ErrorAction Stop

            $result.Status = "Created"
            $script:totalCreated++
            Write-Host "Resource group created successfully."
            Write-Verbose "Resource group '$TargetResourceGroupName' successfully verified and created."
        } else {
            # Tracks when user skips or WhatIf prevents execution
            $script:totalSkipped++
            Write-Verbose "Resource group creation skipped for '$TargetResourceGroupName'."
            Write-ModuleLog -Message "Resource Group '$TargetResourceGroupName' creation skipped." -Level WARN -LogFile $script:LogFilePath
        }
    }
    catch {
        Write-Error "Failed to create resource group: $($_.Exception.Message)"
        Write-Verbose "Error caught during creation of '$TargetResourceGroupName': $($_.Exception.Message)"
        Write-ModuleLog -Message "Failed to create '$TargetResourceGroupName': $($_.Exception.Message)" -Level ERROR -LogFile $script:LogFilePath
        $script:totalErrors++
        $result.Status = "Error"
    }
    
    $result
}

end {
    Write-Host "================================" -ForegroundColor Blue
    Write-Host "      Execution Statistics      " -ForegroundColor Blue
    Write-Host "================================" -ForegroundColor Blue
    Write-Host "Total Requests Processed : $script:totalProcessed"
    Write-Host "Resources Created        : $script:totalCreated" -ForegroundColor Green
    Write-Host "Resources Skipped        : $script:totalSkipped" -ForegroundColor Yellow
    Write-Host "Errors Encountered       : $script:totalErrors" -ForegroundColor Red
    Write-Host "================================" -ForegroundColor Blue

    Write-Host "Resource group operation completed."

    # Replaced Stop-Transcript with Write-ModuleLog
    Write-ModuleLog -Message "Finished processing the creation of Resource Group." -Level INFO -LogFile $script:LogFilePath
}

}