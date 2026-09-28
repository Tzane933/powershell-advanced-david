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
