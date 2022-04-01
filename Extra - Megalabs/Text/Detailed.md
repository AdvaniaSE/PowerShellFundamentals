# Lab 08. Detailed - Text

- Read data to variable from the pre-created file "LabFile1.txt" in the folder "LabFiles"

```PowerShell
$MyVar = Get-Content -Path .\LabFiles\LabFile1.txt
```

- Use `Read-Host` to save your name to `$Name`

```PowerShell
$MyName = Read-Host -Prompt 'What is your name?'
```

- Replace "name" in the text from the first task with: My name is `$Name`

```PowerShell
$MyVar = $MyVar -Replace 'Name',"My name is $MyName"
```

- Replace "date" with today's date using `Get-Date`

```PowerShell
$Today = Get-Date
$MyVar = $MyVar.Replace('date', $Today)
```

- Split the content on "§§§§" and create two new files with the first and second half of the content

```PowerShell
# One way to create the first file
$MyVar -split '§§§§' | Select-Object -First 1 | Out-File -FilePath c:\Temp\File1.txt

# Another way to create the second file
$SecondFile = ($MyVar -split '§§§§')[1]
Set-Content -Value $SecondFile -Path C:\temp\file.txt
```

*Tip!* In PowerShell you can split a string into two variables at the same time!

```PowerShell
$Var1, $Var2 = $MyVar -split '§§§§'
```

---

- Create a HTML or CSV report of the 5 processes that have run for the longest time, including `Name`, `StartTime` and `ID`

```PowerShell
Get-Process | Where-Object -Property StartTime -ne $Null | Sort-Object -Property StartTime | Select-Object -Property Name, StartTime, Id -First 5 | ConvertTo-Csv | Out-File -FilePath C:\temp\process.csv
```

Because not all processes have a defined `StartTime`, we filter away those without one by using `Where-Object`.

---

- Search among the 100s of pre-created files in the LabFiles\100sOfFiles directory for the value 'FINDTHISST' and find out which file contains the string

```PowerShell
Get-ChildItem '.\LabFiles\100sOfFiles\' | Select-String -Pattern 'FINDTHISST'
```

The string is found in the HARBOTPSKS.txt file.

*Tip!* `Select-String` understands RegEx for search pattern. Try searching for "(find|search)"!

*Tip!* Use `Get-ChildItem -Recurse` to search through large subfolder structures for content.

---

*More Reading*

```PowerShell
Get-Help about_Quoting_Rules
Get-Help about_comparison_operators
Get-Help about_Regular_Expressions
```
Regex:
[Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
[regex101.com](https://regex101.com/)