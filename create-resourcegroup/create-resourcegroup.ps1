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

begin {
    # 1. Function start verbose message
    Write-Verbose "Function 'New-TestResourceGroup' execution started."
    
    $TranscriptPath = "C:\Users\student\Desktop\powershell-advanced-david\output\create-resourcegroup-transcript.txt"
    Write-Verbose "Initiating transcript at path: $TranscriptPath"
    Start-Transcript -Path $TranscriptPath -ErrorAction SilentlyContinue
    
    # Initialize execution counters
    $script:totalProcessed = 0
    $script:totalSuccess = 0
    $script:totalFailed = 0
}

process {
    $script:totalProcessed++
    
    # 2. Validation success verbose message (reached after parameter validation passes)
    Write-Verbose "Parameter validation passed successfully for active parameter set: $($PSCmdlet.ParameterSetName)."

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

        # 3. Resource group creation attempt verbose message
        Write-Verbose "Attempting to create Azure Resource Group '$TargetResourceGroupName' in region 'centralus'."
        
        if ($PSCmdlet.ShouldProcess("Resource Group '$TargetResourceGroupName'", "Create")) {
            New-AzResourceGroup `
                -Name $TargetResourceGroupName `
                -Location "centralus" `
                -Tag $Tags `
                -ErrorAction Stop

            $result.Status = "Created"
            $script:totalSuccess++
            Write-Host "Resource group created successfully."
            
            # 4. Successful completion verbose message
            Write-Verbose "Resource group '$TargetResourceGroupName' successfully verified and created."
        }
    }
    catch {
        Write-Error "Failed to create resource group: $($_.Exception.Message)"
        Write-Verbose "Error caught during creation of '$TargetResourceGroupName': $($_.Exception.Message)"
        $script:totalFailed++
        $result.Status = "Error"
    }
    
    $result
}

end {
    Write-Host "====================" -ForegroundColor Blue
    Write-Host " Execution Summary  " -ForegroundColor Blue
    Write-Host "====================" -ForegroundColor Blue
    Write-Host "Total Processed     : $script:totalProcessed"
    Write-Host "Successfully Created: $script:totalSuccess" -ForegroundColor Green
    Write-Host "Failed/Errors       : $script:totalFailed" -ForegroundColor Red
    Write-Host "====================" -ForegroundColor Blue

    Write-Host "Resource group operation completed."
    Write-Verbose "Stopping transcript and finalizing function execution."
    Stop-Transcript -ErrorAction SilentlyContinue
}

}