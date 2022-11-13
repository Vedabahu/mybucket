Get-ChildItem ".\bucket-yaml" -Filter *.yaml |
ForEach-Object {
    Get-Content $_.FullName | Out-String | ConvertFrom-Yaml | ConvertTo-Json -Depth 9 | Out-File ".\bucket\$($_.BaseName).json"
    Write-Output "Comlpeted converting $($_.BaseName).yaml"
}
Write-Output "`n`nStarting Formatting"
.\bin\formatjson.ps1
Write-Output "Formatting complete"
Write-Output "`nFully Completed."
