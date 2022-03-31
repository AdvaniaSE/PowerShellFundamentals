# Lab 05. Input & Output

- Use `Read-Host` with a descriptive question to save your name in a variable called `$MyName`

```Powershell
$MyName = Read-Host -Prompt 'What is your name?'

# Output the variable to different streams using some of the `Write-*` commands

# Write-Host always writes directly to the host, regardless of preference settings
Write-Host $MyName
# > Björn

# Write-Error writes to the error stream
Write-Error $MyName
# > Write-Error: Björn

# Write-Information writes to the information stream, which is often hidden by default
Write-Information $MyName
# >

# Write-Verbose writes to the verbose stream, which is often hidden by default
Write-Verbose $MyName
# >

# Modify the preference variables of the streams to reverse the behavior, instead displaying or hiding the output
$ErrorActionPreference = 'SilentlyContinue'
$InformationPreference = 'Continue'
$VerbosePreference = 'Continue'

# Write-Error now hides the output
Write-Error $MyName
# >

# Write-Information now displays the output
Write-Information $MyName
# > Björn

# Write-Verbose now displays the output
Write-Verbose $MyName
# > VERBOSE: Björn
```

- Create a variable of type `[int]` named `$MyAge` with the value of 0

```Powershell
[int]$MyAge = 0

# Use Read-Host with a descriptive question to save your age as a number
$MyAge = Read-Host -Prompt 'What is your age'
# > What is your age: 42

# Try it again but this time as a string
$MyAge = Read-Host -Prompt 'What is your age'
# > What is your age: Fortytwo
# > "Input string was not in a correct format."

# The variable will still have the number as the value
$MyAge
# > 42

```

- Find an `Out-*` command that outputs to a file

```PowerShell
# Get all commands matching the filter
Get-Command Out-*

# The command Out-File redirects the default stream to a file
# Use Get-Help to find out how to use it
Get-Help -Name Out-File -Detailed

$Path = <path/to/MyLabFile.csv>

# Output $MyName to "MyLabFile.csv" created in Lab 3
# Not specifying -Append will overwrite the contents of the file
# Specifying -NoNewLine will create no new line after the text
$MyName | Out-File -FilePath $Path -NoNewline

# Add a comma to the same file, again without adding a newline
# Specifying -Append will add to the file instead of overwriting it
Out-File -FilePath $Path -InputObject ',' -NoNewline -Append

# Add the value of the $MyAge variable, this time also adding a newline
# Not specifying -NoNewLine will add a newline after the text
$MyAge | Out-File -FilePath $Path -Append
```

- Use VSCode to save these commands to the PowerShell script file called `MyLabFile.ps1` in the folder created in [Lab 3](../03.%20Commands%20and%20Methods/Lab.md)

---

*More Reading*

```PowerShell
Get-Command Write-* -Module Microsoft.PowerShell.Utility
Get-Help about_Redirection
```
