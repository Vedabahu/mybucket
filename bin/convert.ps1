Get-ChildItem "$PSScriptRoot\..\bucket-yaml" -Filter *.yaml |
ForEach-Object {
    Get-Content $_.FullName | Out-String | ConvertFrom-Yaml | ConvertTo-Json -Depth 9 | Out-File ".\bucket\$($_.BaseName).json"
    Write-Output "Comlpeted converting $($_.BaseName).yaml"
}
Write-Output "`n`nStarting Formatting"
Invoke-Expression $PSScriptRoot\.\formatjson.ps1
Write-Output "Formatting complete"
Write-Output "`nFully Completed."
