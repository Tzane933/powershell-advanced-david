Configuration DavidBaseline {
    Node "localhost" {
        
        
        File EnsureAdminFolder {
            Ensure          = "Present"
            Type            = "Directory"
            DestinationPath = "C:\AdminTools"
        }

        
        File EnsureScriptsFolder {
            Ensure          = "Present"
            Type            = "Directory"
            DestinationPath = "C:\AdminScripts"
        }
    }
}