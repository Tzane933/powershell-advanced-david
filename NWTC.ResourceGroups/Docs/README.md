### Module Purpose

This module's purpose is to package Azure Resource Group creation and tools into a single PowerShell module. This module makes it easy to employ groups, and enforces naming conventions, and also has proper logging.
Features

This module has a flexible input. It supports creating resource groups using direct names or numerical project IDs ('RG-') Has pipeline integration it accepts input directory through the PowerShell pipeline Also Safe testing with '-WhatIf' built in also supports 'ShouldProcess' and allows dry-run execution prior to a change.
Installation Instructions
### Installation Instructions
You can either git clone the repo, by using "git clone https://github.com/Tzane933/powershell-advanced-david" or manually install via github and download it as a zip file.
Usage Examples

### Usage Examples

Create a resource group name New-TestResourceGroup -ResourceGroupName "LabResources"

Create by project ID New-TestResourceGroup -ProjectID 1001

Pipeline a input with a whatif simulation 1001 | New-TestResourceGroup -WhatIf
Version

### Version 
Module Version: 1.0.0