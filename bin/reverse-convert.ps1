Get-ChildItem ".\bucket" -Filter *.json |
ForEach-Object {
    Get-Content $_.FullName | Out-String | ConvertFrom-Json | ConvertTo-Yaml | Out-File ".\bucket-yaml\$($_.BaseName).yaml"
    Write-Output "Comlpeted converting $($_.BaseName).json"
}
Write-Output "`n`nFully Completed."
