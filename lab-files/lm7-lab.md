## Task 1

Configuration Name: CompanyBaseLine
Node:The node is the localhost
Resource 1: AutomationFolder: 
Resource 2: ConfigFile: 
What each resource is doing: 
AutomationFolder manages and makes sure a specific directory exists on the machine.
ConfigFile manages a specific config file and makes sure its present and matches the desired content

## Task 2
I made the new file lm7-dsc.ps1 and made it very simple.
```
Configuration DavidBaseline {
    
    Node "localhost" {
        
        
        File EnsureAdminFolder {
            Ensure          = "Present"
            Type            = "Directory"
            DestinationPath = "C:\AdminTools"
        }
    }
}
```
## Task 3
Created the MOF file which is named lm7=-dsc.ps1 and its located in the DSC dir.
The purpose of this file its to be a config file that can be easily used and be applied to the target node.
One thing I noticed is once I ran it it gives a nicely detailed output telling me the mode of the file, when it was also last written and also the length name.

## Task 4
the output of me running the command
```
VERBOSE: Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = SendConfigurationApply,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.                                                                                          
VERBOSE: An LCM method call arrived from computer PA-david with user sid S-1-5-21-2342201011-3317785503-1470192587-500.                                                                                                                                                                                                       
VERBOSE: [PA-david]: LCM:  [ Start  Set      ]                                                                                                                                                                                                                                                                                
VERBOSE: [PA-david]: LCM:  [ Start  Resource ]  [[File]EnsureAdminFolder]
VERBOSE: [PA-david]: LCM:  [ Start  Test     ]  [[File]EnsureAdminFolder]
VERBOSE: [PA-david]:                            [[File]EnsureAdminFolder] The destination object was found and no action is required.
VERBOSE: [PA-david]: LCM:  [ End    Test     ]  [[File]EnsureAdminFolder]  in 0.0110 seconds.
VERBOSE: [PA-david]: LCM:  [ Skip   Set      ]  [[File]EnsureAdminFolder]
VERBOSE: [PA-david]: LCM:  [ End    Resource ]  [[File]EnsureAdminFolder]
VERBOSE: [PA-david]: LCM:  [ End    Set      ]
VERBOSE: [PA-david]: LCM:  [ End    Set      ]    in  0.1030 seconds.
VERBOSE: Operation 'Invoke CimMethod' complete.
VERBOSE: Time taken for configuration job to complete is 0.642 seconds
```

## Task 5
Test-DscConfiguration, output was True
Get-DsConfiguration output:
```
ConfigurationName    : DavidBaseline                                                                                                                                                                                                                                                                                          
DependsOn            :                                                                                                                                                                                                                                                                                                        
ModuleName           : PSDesiredStateConfiguration                                                                                                                                                                                                                                                                            
ModuleVersion        :                                                                                                                                                                                                                                                                                                        
PsDscRunAsCredential :                                                                                                                                                                                                                                                                                                        
ResourceId           : [File]EnsureAdminFolder
SourceInfo           : 
Attributes           : {directory}
Checksum             : 
Contents             : 
CreatedDate          : 9/28/2026 6:17:37 PM
Credential           : 
DestinationPath      : C:\AdminTools
Ensure               : present
Force                : 
MatchSource          : 
ModifiedDate         : 9/28/2026 6:17:37 PM
Recurse              : 
Size                 : 0
SourcePath           : 
SubItems             : 
Type                 : directory
PSComputerName       : 
CimClassName         : MSFT_FileDirectoryConfiguration
```
## Task 6
I added the second resource which was 'EnsureScriptsFolder'


Recompile and redeployed the configuration
```
VERBOSE: Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = SendConfigurationApply,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.                                                                                          
VERBOSE: An LCM method call arrived from computer PA-david with user sid S-1-5-21-2342201011-3317785503-1470192587-500.                                                                                                                                                                                                       
VERBOSE: [PA-david]: LCM:  [ Start  Set      ]                                                                                                                                                                                                                                                                                
VERBOSE: [PA-david]: LCM:  [ Start  Resource ]  [[File]EnsureAdminFolder]                                                                                                                                                                                                                                                     
VERBOSE: [PA-david]: LCM:  [ Start  Test     ]  [[File]EnsureAdminFolder]                                                                                                                                                                                                                                                     
VERBOSE: [PA-david]:                            [[File]EnsureAdminFolder] The destination object was found and no action is required.                                                                                                                                                                                         
VERBOSE: [PA-david]: LCM:  [ End    Test     ]  [[File]EnsureAdminFolder]  in 0.0320 seconds.
VERBOSE: [PA-david]: LCM:  [ Skip   Set      ]  [[File]EnsureAdminFolder]
VERBOSE: [PA-david]: LCM:  [ End    Resource ]  [[File]EnsureAdminFolder]
VERBOSE: [PA-david]: LCM:  [ Start  Resource ]  [[File]EnsureScriptsFolder]
VERBOSE: [PA-david]: LCM:  [ Start  Test     ]  [[File]EnsureScriptsFolder]
VERBOSE: [PA-david]:                            [[File]EnsureScriptsFolder] The system cannot find the file specified.
VERBOSE: [PA-david]:                            [[File]EnsureScriptsFolder] The related file/directory is: C:\AdminScripts.
VERBOSE: [PA-david]: LCM:  [ End    Test     ]  [[File]EnsureScriptsFolder]  in 0.0040 seconds.
VERBOSE: [PA-david]: LCM:  [ Start  Set      ]  [[File]EnsureScriptsFolder]
VERBOSE: [PA-david]:                            [[File]EnsureScriptsFolder] The system cannot find the file specified.
VERBOSE: [PA-david]:                            [[File]EnsureScriptsFolder] The related file/directory is: C:\AdminScripts.
VERBOSE: [PA-david]: LCM:  [ End    Set      ]  [[File]EnsureScriptsFolder]  in 0.0340 seconds.
VERBOSE: [PA-david]: LCM:  [ End    Resource ]  [[File]EnsureScriptsFolder]
VERBOSE: [PA-david]: LCM:  [ End    Set      ]
VERBOSE: [PA-david]: LCM:  [ End    Set      ]    in  0.4720 seconds.
VERBOSE: Operation 'Invoke CimMethod' complete.
VERBOSE: Time taken for configuration job to complete is 1.379 seconds
```

Ran Test-DscConfgiuration the output was true.
