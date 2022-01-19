## Lab 04. Detailed - Variables

- Find the name of your computer in environment variables

```PowerShell
# Environment variables in powershell is located in a PSDrive. To list all environment variables, use the Get-ChildItem cmdlet
Get-ChildItem -Path Env:

# To expand an environment variable, you can use the PSDrive as a variable
$Env:COMPUTERNAME
```

---

- Test using `-ErrorVariable`. Can you find a scenario where this parameter could be useful?

```PowerShell
# One such example is when exploring the filesystem.
$MyFiles = Get-ChildItem -Path C:\ -Recurse -ErrorVariable MyErrors -ErrorAction SilentlyContinue
# After running this command, you can use the $MyError variable to see which folders you dont have access to, or write to a log.
$MyErrors
```

---

- Store command results in variable and find the n:th object

```PowerShell
# The previously run command should result in two arrays of objects, $MyFiles and $MyErrors. You can enumerate it using index numbers
$MyFiles[0]
$MyFiles[1]
$MyFiles[2]
# You can also use range operator, '..', to get a series of results.
$MyFiles[0..10]
```

---

- Save today's date to a variable, and explore the type and the different properties and methods of the object

```PowerShell
# Use Get-Command to find how to get today's date
Get-Command -Verb Get -Noun Date

# Store it in a variable
$Today = Get-Date

# Get the different properties and methods of the DateTime object
$Today | Get-Member
```

---

- Find out what weekday New Year's Eve is in 2050

```PowerShell
# Use the DayOfWeek method to get what day it is
$FutureDate = Get-Date -Date 2050-12-31
$FutureDate.DayOfWeek

# And how many days is there until then?
# You can use normal math formulas to calculate dates and time spans in PowerShell
$FutureDate - $Today

# What type is the resulting object?
# The resulting object should be System.TimeSpan
$FutureDateType = $Date - $Today
$FutureDateType | Get-Member

# What date is it 500 days after New Year's Eve 2050?
# Use the AddDays method to calculate this
$FutureDate.AddDays(500)
```

---

- What is the difference of using `$var = ExampleCommand` and `ExampleCommand -outVariable var`? Read the help and describe!

```PowerShell
# This is described in the about_CommonParameters help chapter, readable using Get-Help. Optionally you may also add the -ShowWindow parameter to easier read and search help contents
Get-Help about_CommonParameters -ShowWindow

# Using $Variable = Command will force all output only to a variable
$MyVar = Get-Process

# Using the OutVariable will send out put to the pipeline, as well as storing it in a variable
Get-Process -OutVariable MyVar
```

---

*More Reading*

```PowerShell
Get-Help about_Automatic_Variables
Get-Help about_Environment_Variables
get-help about_Variables
```
