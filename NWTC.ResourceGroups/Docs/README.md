### Module Purpose
This modules purpose is to package azure resource group creation and tools into a single powershell module. This module makes it easy to employ groups, and enforces namingg convetions, and also has proper logging.
### Features
This module has a flexibile input, it supports creating resource groups using direct names or numerical projects IDs ('RG-<ID>')
Has pipeline integration it accepts sinput directory through the powershell pipeline
Also Safe testing with '-WhatIf' built in also supports 'ShouldProcess' and allows dry-run execution prioer to a change
### Installation Instructions
You can either git clone the repo, by using "git clone https://github.com/Tzane933/powershell-advanced-david" or manually install via github and download it as a zip file.
## Usage Examples

Create a resource group name
New-TestResourceGroup -ResourceGroupName "LabResources"

Create by project ID
New-TestResourceGroup -ProjectID 1001

Pipeline a input with a whatif simulation
1001 | New-TestResourceGroup -WhatIf
### Version 
Module Version: 1.0.0