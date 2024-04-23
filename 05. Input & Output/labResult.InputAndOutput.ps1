$MyName = Read-Host -Prompt 'What is your name?'

Write-Host $MyName

[int]$MyAge = 0
$MyAge = Read-Host -Prompt 'What is your age'
$Path = "$PSScriptRoot\MyLabFile.csv"
Write-Verbose "Database path: $path"
$MyName | Out-File -FilePath $Path -NoNewline
Out-File -FilePath $Path -InputObject ',' -NoNewline -Append
$MyAge | Out-File -FilePath $Path -Append
