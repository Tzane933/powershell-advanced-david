Describe "RG Test" {
    It "Verifies resource group exists in Azure" {
        $rg = Get-AzResourceGroup -Name "New-RG" -ErrorAction SilentlyContinue
        $rg.ResourceGroupName | Should -Be "New-RG"
    }
}