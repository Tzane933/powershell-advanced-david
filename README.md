# -powershell-advanced-david

## New Function: 'New-TestResorceGroup'
The new functions that I created is called "New-TestResourceGroup" its a advanced powershell function to help streamline working with azure on tagging and with resource groups.

## Key Features
It now supports flexible administration with a more explicit name 'ResourceGroupName' plus automated project tracking now with 'ProjectID' with automatic 'RG-' prefixing. also added more safety controls that was integrated with `CmdletBinding(SupportsShouldProcess=$true` for native `-WhatIf` and `-Confirm` safety simulations. I also worked on more detailed audit logs with `Write-Verbose` and `Write-Debug` which makes working with this a lot more easier.