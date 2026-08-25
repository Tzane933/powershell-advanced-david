Task 1
The original command: Get-Process -Name explore
The error: Cannot find the process with the name explore
The error that came up seems to be related to the process "explore" which is not spelled correctly, it should be explorer and once that is fixed, it will provide you information on the process correctly now.
Correct Command: Get-Process -Name explorer

Task 2
Example of verbose output:
VERBOSE: Starting script and initiating transcript at .\create-resourcegroup-transcript.txt
VERBOSE: Attempting to create Azure Resource Group 'New RG' in 'centralus'
VERBOSE: Stopping transcript
Example of debug output:
DEBUG: Variable $TranscriptPath evaluated as: .\create-resourcegroup-transcript.txt
DEBUG: Executing New-AzResourceGroup cmdlet with Name: New RG and Location: centralus
DEBUG: 2:20:29 PM - [ConfigManager] Got nothing from [DisplaySecretsWarning], Module = [], Cmdlet = []. Returning default value [True].
DEBUG: 2:20:29 PM - NewAzureResourceGroupCmdlet begin processing with ParameterSet '__AllParameterSets'.
DEBUG: 2:20:29 PM - [ConfigManager] Got nothing from [DisplayBreakingChangeWarning], Module = [Az.Resources], Cmdlet = [New-AzResourceGroup]. Returning default value [True].
DEBUG: 2:20:29 PM - [ResourceManagerCmdletBase.ExecuteCmdlet] Caught unhandled exception: System.Management.Automation.PSInvalidOperationException: Run Connect-AzAccount to login.
DEBUG: 2:20:29 PM - [ConfigManager] Got nothing from [EnableErrorRecordsPersistence], Module = [Az.Resources], Cmdlet = [New-AzResourceGroup]. Returning default value [False].
DEBUG: Exception caught during resource group creation: Run Connect-AzAccount to login.

The main differences I have noticed is Verbose is kinda vague in in its outputs unlike debug, which provides a lot more useful information to the user

Task 3
Test name: RG Test
Expected Result: RG Test new resource group has been created
Actual Result:
[+] C:\Users\student\Desktop\powershell-advanced-david\LM2\create-resourcegroup.tests.ps1 315ms (1 test)
Tests completed in 348ms
Tests Passed: 1, Failed: 0, Skipped: 0, Inconclusive: 0, NotRun: 0