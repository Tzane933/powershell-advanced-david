### LM5

### Task 1
I created all of the directories and files that were needed at the start I also made a copy off 'create-resourcegroups.ps1' and put it in the public directory and named it 'New-TestResourceGroup.ps1'
### Task 2
I worked and configured 'NWTC.ResourceGroups.psm1'to dynamically dot-sourcve all .ps1 scripts in the following directoy 'Public' I alkso tested module import using the command 'Import-Module ./NWTC.ResourceGroups.psm1 -Force'
### Task 3
I made the module manifest 'NWTC.ResourceGroups.psd1' by using the command 'New-ModuleManifest' I also configured the metadata including 'ModelVersion = '1.0.0'' and added Author 'Author= 'David Mosqueda'' and a description
### Task 4
I added 'Export-ModuleMember -Function $publicFunctions.BaseName' to my 'NWTC.ResourceGroups.psm1' so that can expose the public functions. I also verfified exported cmdlets using the command 'Get-Command -Module NWWTC.ResourceGroups'
## Task 5
I implemnted a private helper functions in 'Write-ModuleLog.ps1' in the 'Private' Directory that handles timestamped logg formatting into 'INFO', 'WARN', & 'ERROR'
I also updated 'NWTC.ResourceGroups.psm1 to ddot source private functions without needing to export them.
## Task 6
I tested the paramter sets by 'ByName' & 'ByProjectID' pipeline processing and using '-WhatIf' exection for 'New-TestResourceGroup'
I verfied hte log output generation and paths in the 'Logs' Direcotry