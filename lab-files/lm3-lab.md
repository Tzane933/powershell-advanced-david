Task 1
I created a more advanced function, wrapped it around my entire script. "New-TestResourceGroup", also added "[CmdletBinding()]"

Task 2
I added the hashtable parameters "$Tags" so it cna accept data structures for example "(@{Department="IT"; Environment="Test"})" also integrated the -Tag parameter into the "New-AZResourceGroup" command

Task 3
I configured the $ResourceGroupName parameter with teh atribute with ValueFromPipeline = $true, we also enabled the string value to be piped dirrectly into the function "DevTest" | New-TestResourceGroup

Task 4
I replaced the plain text host messages with "[PSCustomObject]" which contians the properties ResourceGroupName, Location, Status, & Tags for example I also configured it to have a dynamic status update.

Task 5
I upggraded the cmdlet binding as well "[CmdletBinding(SupportsShouldProcess=$true)]" also wrapped resource creation logic inside a if statement in  if "[$PSCmdlet.ShouldProcess]" also added condition blocks to support -WhatIf and even -Confirm

Task 6
Renamed all the dir so its more structured properly, and looks cleaner just in general. Also fixed the path forr the output director for the transcripts so they are stored properly in the correct directory.