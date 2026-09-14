$privateFunctions = Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" -ErrorAction SilentlyContinue
foreach ($file in $privateFunctions) {
    . $file.FullName
}

$publicFunctions = Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" -ErrorAction SilentlyContinue
foreach ($file in $publicFunctions) {
    . $file.FullName
}


if ($publicFunctions) {
    Export-ModuleMember -Function $publicFunctions.BaseName
}