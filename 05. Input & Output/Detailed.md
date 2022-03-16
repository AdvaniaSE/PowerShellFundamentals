## Lab 05. Input & Output

- Use `Read-Host` with descriptive parameters to save your name in a variable called `$MyName`.

```Powershell
$MyName = Read-Host -Prompt 'What is your name?'

# Without changing the `$VerbosePreference` variable, Use `Write-Verbose` and output the variable value
Write-Verbose $MyName -Verbose
# > VERBOSE: Björn
```

- Create an variable of type `[int]` named `$MyAge`

```Powershell
# Because of a combination of the implicit setting of the variable type, and the PowerShell converting between different object types, you can do this by setting the variable to either '0', '[string]::Empty', or 'null'
[int]$MyAge = 0
[int]$MyAge = [string]::Empty
[int]$MyAge = $null
$MyAge
# > 0

# Use `Read-Host` with descriptive parameters to save your age to the `$MyAge` variable
## Because of the implicitly typed variable we will not be able to set the value from Read-Host to anything other than an int.
$MyAge = Read-Host -Prompt 'What is your age'
# > What is your age: Fortytwo
# > MetadataError: Cannot convert value "tjutvå" to type "System.Int32". Error: "Input string was not in a correct format."
$MyAge = Read-Host -Prompt 'What is your age'
# > What is your age: 42
$MyAge
# > 42

```

- Find an `Out-*` command that outputs the default stream to a file.

```PowerShell
# Get all commands matching the filter
Get-Command Out-*
# Out-File redirects the default stream to a file. Find all parameters available using 'Get-Help'
Get-Help Out-File

# Use this command to output the `$MyName` variable to the `MyLabFile.csv` file created in lab  3 - **Without adding a newline**
$MyName | Out-File -FilePath <path/to/MyLabFiles.csv> -NoNewline
# Use the same command to append a semicolon - `;` - the the same file, again **Without adding a newline**
Out-File -FilePath <path/to/MyLabFiles.csv> -InputObject ';' -NoNewline -Append
# Use the same command to append the value of the `$MyAge` variable - this time also adding a newline
$MyAge | Out-File -FilePath <path/to/MyLabFiles.csv> -Append
```

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in lab 3 - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`
