## Lab 06. Detailed - Input & Output

- Use `Read-Host` to save your age as a number to a variable called `$Age`

```PowerShell
$Age = Read-Host -Prompt 'What is your age?'
```

---

- Use `$Age` to calculate your birth year and print it to the console

```PowerShell
# First we need to have today's date in a variable
$Today = Get-Date

# We then want to remove the number of years in $Age, but as there is only an AddYears method we can simply combine it with a - to add "-n" years
$BirthYear = $Today.AddYears(-$Age)

# To output only the year to console, use the Write-Output cmdlet, and the Year property
Write-Output $BirthYear.Year
```

---

- Use `Read-Host` to save secure input using a parameter

```PowerShell
# Use the AsSecureString parameter to prevent the variable from being human readable
$SecureString = Read-Host -Prompt 'Secure string test' -AsSecureString
# Input will look like this:
# Secure string test: *********

# To verify the string, try to output it to console and you will only get System.Security.SecureString
$SecureString
```

*Tip:* It's possible to convert a SecureString back to plain text in the same context as it was created in.

---

- Run a non working command such as `Get-FakeCommand`

```PowerShell
Get-FakeCommand

# Explore the error message
Get-Error
```

- Change `$ErrorActionPreference` to "SilentlyContinue" and try again

```PowerShell
$ErrorActionPreference = "SilentlyContinue"
Get-FakeCommand
```

- Restore the ErrorActionPreference to its default setting


```PowerShell
$ErrorActionPreference = "Continue"
```

---

- Try using both `Write-Host` and `Write-Output` and save the results to a variable
    - What is the difference?
    - Why does it happen?

```PowerShell
$MyVar = Write-Host 'This is from Write-Host'
# Console will output 'This is from Write-Host'
# The $MyVar variable is empty
$MyVar


$MyVar = Write-Output 'This is from Write-Output'
# No console output
$MyVar
# The variable contains the data from Write-Output, 'This is from Write-Output'
```

This behaviour is because `Write-Host` outputs data to the information stream, which by default is captured by the console.
`Write-Output` outputs its result to the output stream, which in our case above is directed to the variable.

---

*More Reading*

```PowerShell
Get-Command Write-* -Module Microsoft.PowerShell.Utility
Get-Help about_Redirection
```
