### LM5

## Task 1
Current Version: 1.0.0
Author: David Mosqueda
Description: Manages Azurre resource groups and automation with azure.
Exported Commnds: 'Neww-TestResourceGroup'

## Task 2
I created the new public function Get-ResourceGroupSummary, it shows all the Groups that you made and it provides location + tags from your groups

## Task 3
Updated the manifest to change the module version

## Task 4
Created the CHANGELOG.MD file and edited it also added the needed information in it


## Task 5
Created the RELEASENOTES.md and ediited it also added the needed information in it


## Task 6
Tested out the module with the following commands
Import-Module .\NWTC.ResourceGroups -Force
Get-Module NWTC.ResourceGroups
Get-Command -Module NWTC.ResourceGroups
Get-ResourceGroupSummary

Results:
PS C:\Users\student\Desktop\powershell-advanced-david> Import-Module .\NWTC.ResourceGroups -Force
PS C:\Users\student\Desktop\powershell-advanced-david> Get-Module NWTC.ResourceGroups

ModuleType Version    PreRelease Name                                ExportedCommands
---------- -------    ---------- ----                                ----------------
Script     1.1.0                 NWTC.ResourceGroups                 Get-ResourceGroupSummary

PS C:\Users\student\Desktop\powershell-advanced-david> Get-Command -Module NWTC.ResourceGroups

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-ResourceGroupSummary                           1.1.0      NWTC.ResourceGroups

PS C:\Users\student\Desktop\powershell-advanced-david> Get-ResourceGroupSummary

ResourceGroupName                                     Location  Tags
-----------------                                     --------  ----
MicrosoftIntermediate                                 centralus {}
Mosqueda-D_group                                      centralus 
NetworkWatcherRG                                      centralus 
Win11-C1_group                                        centralus 
Win11-C1_group_03310908                               centralus 
Win11-C1_group_03310921                               centralus 
S2022-DC2_group                                       centralus 
defaultresourcegroup-cus                              centralus 
MA_defaultazuremonitorworkspace-cus_centralus_managed centralus 
powershell-advanced-david                             centralus {}
MicrosoftAdvanced                                     centralus {}
New-RG                                                centralus 
S2025-DC1_group                                       centralus 
DevTest                                               centralus {[Department, IT], [Environment, Test]}
RG-1001                                               centralus {[Department, IT], [Environment, Test]}
Dev1                                                  centralus {[Department, IT], [Environment, Test]}
1001                                                  centralus {[Department, IT], [Environment, Test]}
1002                                                  centralus {[Department, IT], [Environment, Test]}
1003                                                  centralus {[Department, IT], [Environment, Test]}
TestRG-LogCheck                                       centralus {[Department, IT], [Environment, Test]}
MicrosoftAdvanced-asr                                 centralus 
