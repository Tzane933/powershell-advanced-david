Describe "New-TestResourceGroup Function Tests" {
    BeforeAll {
        
        . "$PSScriptRoot\create-resourcegroup.ps1"
    }

    It "Should exist as a valid function" {
        Get-Command New-TestResourceGroup -ErrorAction SilentlyContinue | Should -Not -BeNullOrEmpty
    }

    It "Should successfully support the ByName parameter set with WhatIf" {
        { New-TestResourceGroup -ResourceGroupName "TestRG" -WhatIf -ErrorAction Stop } | Should -Not -Throw
    }

    It "Should successfully support the ByProjectID parameter set with WhatIf" {
        { New-TestResourceGroup -ProjectID 9999 -WhatIf -ErrorAction Stop } | Should -Not -Throw
    }
}