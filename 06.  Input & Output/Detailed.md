## Lab 06. Detailed - Input & Output

- Use Read-Host to save your age as a number to a variable called `$Age`

```Powershell
$Age = Read-Host -Prompt 'What is your age'
```

---

- Use `$Age` to calculate your birth year and print it to the console

```Powershell
# First we need to have todays date in a variable
$Today = Get-Date

# Because we need to remove the number of years in $Age, but there is only an AddYears method, we can simply combine it with a - to add "-n" years.
$BirthYear = $Today.AddYears("-$age")

# To output only the year to console, use the Write-Output CmdLet, and the Year property
Write-Output $BirthYear.Year
```

---

- Use Read-Host to save secure input using a parameter

```Powershell
# Use the AsSecureString parameter to prevent the variable from beeing human readable
$SecureString = Read-Host -Prompt 'Secure string test' -AsSecureString
# Input will look like this:
# Secure string test: *********

# To verify the string, try to output it to console and you will only get System.Security.SecureString
$SecureString
```

---

- Run a non working command "ThisCommandIsNotFound".

```Powershell
ThisCommandIsNotFound

# Explore the error message
Get-Error

# Change ErrorActionPreference to "SilentlyContinue" and try again.
$ErrorActionPreference = "SilentlyContinue"
ThisCommandIsNotFound

# Restore the ErrorActionPreference to its default setting
$ErrorActionPreference = "Continue"
```

---

- Try using both Write-Host and Write-Output and saving the results to a variable. What is the difference? Why does it happen?

```Powershell
$MyVar = Write-Host 'This is from write-host'
#Console will output 'This is from write-host'
# The $MyVar variable is empty
$MyVar


$MyVar = Write-Output 'This is from write-output'
# No console output
$MyVar
# The variable contains the data from Write-Output, 'This is from write-output'
```

This behaviour is because Write-Host outputs data to the information stream, which by default is captured by the console.
Write-Output outputs its result to the output stream, which in our case above is directed to the variable.

---

*More Reading*

```Powershell

```
