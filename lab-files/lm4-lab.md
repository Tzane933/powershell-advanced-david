### LM3
a. three strengths of the function
One strength is a safety control 'SupportsShouldProcess' is integrated and also native support for -WhatIf and even -Confirm which helps prevent accidental changes from happening. Also input safety with parameter validation I have a semi strict validation rule with "ValidateLength(3,20)" And I have a structured object output which returns a detailed output from "'PSCustomObject' instead of boring plaintext
b. three areas that could be improved
I am kinda lacking in pipeline handling especially with the function Begin, Process, and End blocks. and also hardcoding where my transcripts goes was not really a good idea entirely, I will fix that soon. And another area I could improve is the lack of end of run summary reporting my script only outputs objects and stops and it doesn't track or display an form of summary report at the end.
### Task 2
I added two helpful parameters 'ByName' & 'ByProjectID' so it can support multiple ways to make a resource group. I also configured the script so it automatically formats the project ID with "RG-" 
### task 3
I implemented the begin, process, and end blocks to support full pipeline streaming. I also learned that strucuring a more advanced function this way helps seeprates the lifeccle for tasks like starting the transcript goes in the begin block and item creation or evaluation go in the process bock and cleanup tasks goes in the end block so this helps the script to process arrays and project IDS easily without breaking.
### Task 4
I implemented a more granular 'Write-Verbose' tracking across the function lifecycle to trace execution milestones. The whole funcion starts and logs when 'New-TestResourceGroup' begins the transcript, and once everything is validated and everthing becomes clear to goot goves is a detailed target name and region.
### Task 5
I made 'ResourceGroups.txt' which has the project ID's '1001', '1002', & '1003' 3 objects were processed and all 3 were created with no issues and I got no warnings.
### Task 6
I added a counter variable in the 'begin' block (`$script:totalProcessed`, `$script:totalCreated`, `$script:totalSkipped`, and `$script:totalErrors`),I also updated the 'process' block so it it can track successful creations, skipped operations like for example '-WhatIf' and also caught exceptions it also provides a formatted summary now in a table
### Task 7
I updated the comment-based help block inside the function so it more accurately reflects the parameter sets aand usage examples. I also updated the repo and function + README file.