# -powershell-advanced-david

## New Function: 'New-TestResorceGroup'
The new functions that I created is called "New-TestResourceGroup" its a advanced powershell function to help streamline working with azure on tagging and with resource groups.

## Key Features
It now supports flexible administration with a more explicit name 'ResourceGroupName' plus automated project tracking now with 'ProjectID' with automatic 'RG-' prefixing. also added more safety controls that was integrated with `CmdletBinding(SupportsShouldProcess=$true` for native `-WhatIf` and `-Confirm` safety simulations. I also worked on more detailed audit logs with `Write-Verbose` and `Write-Debug` which makes working with this a lot more easier.

## NWTC.ResourceGroups
I added a new directory to my repo called NWTC.ResourceGroups this new directory contains functions and modules developed for Azure administration and automation.

## Key Features
It has flexible parameter sets. You can create resource groups by using the command 'ResourceGroupName' or automatically with the command 'ProjectID' which prefixes the name as 'RG-<ID>'
It has safety controls integrated. For example, `CmdletBinding(SupportsShouldProcess=$true)` also provides native support for '-WhatIf' and '-Confirm' and dry-run simulations.
And a modular architecture built with separate 'Public' and 'Private' function directories to maintain a clean scope and isolate the helper tools.
