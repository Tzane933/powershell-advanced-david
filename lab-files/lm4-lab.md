### LM3
a. three strengths of the function
One strength is a safety control "SupportsShouldProcess" is integrated and also native support for -WhatIf and even -Confirm which helps prevent accidental changes from happening. Also input safety with parameter validation I have a semi strict validation rule with "ValidateLength(3,20)" And I have a structured object output which returns a detailed output from "PSCustomObject" instead of boring plaintext
b. three areas that could be improved
I am kinda lacking in pipeline handling especially with the function Begin, Process, and End blocks. and also hardcoding where my transcripts goes was not really a good idea entirely, I will fix that soon. And another area I could improve is the lack of end of run summary reporting my script only outputs objects and stops and it doesn't track or display an form of summary report at the end.
### Task 2
I added two helpful parameters 'ByName' & 'ByProjectID' so it can support multiple ways to make a resource group. I also configured the script so it automatically formats the project ID with "RG-"
