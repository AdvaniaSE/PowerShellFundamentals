# Lab 04. Variables

- Find your username in an environment variable

```PowerShell
$env:UserName
```

- Find a command to get today's date and store it in the variable `$Today`

```PowerShell
$Today = Get-Date

# Examine the variable $Today and see how it looks
# Shows the day, date, and time
$Today
# > Tuesday, 15 March 2022 15:30:50

# Find one or more methods you can use to display the date in a different format
# ToLongDateString() outputs only the date
$Today.ToLongDateString()
# > Tuesday, 15 March 2022

# ToShortTimeString() outputs only the time in hours and minutes
$Today.ToShortTimeString()
# > 15:30

# The ToString() method can be used to output it in any form you want.
$Today.ToString('yy-MM-dd_HH:mm.ss')
# > 22-03-15_15:30.50

# To print text you need to escape characters that can be interpreted as date formatting symbols
$Today.ToString("To\da\y i\s \t\he dd:\t\h o\f MMMM, yyyy. I\t\s \t\he HH:\t\h \hour o\f \t\he \da\y")
# > Today is the 15:th of March, 2022. Its the 15:th hour of the day

# Check the type of the variable and its properties and methods
$Today | Get-Member
# or
Get-Member -InputObject $Today

# Using a command, try to get the variable $Today. Notice the output and the difference from looking at the variable directly
Get-Variable -Name Today
# Using Get-Variable returns a PSVariable type object, which we can also see by running 
Get-Variable -Name Today | Get-Member
```

- Create a list of colours, containing at least three different ones

```PowerShell
$MyColours = @('red','green','blue')
# Pick one of the colours and find it in the list
$MyColours[0]
# > red

# Find a way to add another colour to the list
$MyColours += 'yellow'

# Try it using different type of lists or collections, such as
## Array
[array]$MyArray = @()
$MyColours += 'red'
$MyColours += 'green'
$MyColours += 'blue'
$MyColours += 'yellow'

## Hashtable
# Hashtables needs to be in the form of key = value, and keys must be unique, so we can't make a list of only colours. Lets add some nuance to it!
$MyHashTable.Add('red','dark')
$MyHashTable.Add('blue','light')
# we cant add one more value with the same key
$MyHashTable.Add('red','light')
# > MethodInvocationException: Exception calling "Add" with "2" argument(s): "Item has already been added. Key in dictionary: 'red'  Key being added: 'red'"
## But we can also add an array as value
$MyHashTable.Add('green',@('dark','light'))
$MyHashTable
# > Name                           Value
# > ----                           -----
# > blue                           lightk
# > green                          {dark, light}
# > red                            dark

## Arraylist
# When adding an object to an arraylists powershell automatically outputs the count of the amount of proerties. We can suppress this by assining it to $null
$MyArrayList = [System.Collections.ArrayList]::new()
$MyArrayList.Add('red')
# > 0
$MyArrayList.Add('green')
# > 1
$Null = $MyArrayList.Add('blue')

## List<t>
$MyListT = [System.Collections.Generic.List[object]]::new()
$MyListT.Add('red')
$MyListT.Add('green') 
$MyListT.Add('blue') 
```

- Create an explicitly typed variable of type [int] and add a value to it.

```PowerShell
[int]$MyNumber = 42

# Try to set the value of the [int] type variable to a string instead
$MyNumber = 'Fortytwo'
# > MetadataError: Cannot convert value "Fortytwo" to type "System.Int32". Error: "Input string was not in a correct format."

# Change the $ErrorActionPreference variable to 'SilentlyContinue'
$ErrorActionPreference = 'SilentlyContinue'

# Try again to set the value of the [int] type variable to a string and notice the difference
$MyNumber = 'Fortytwo'
# No output is given

# Verify the value of the variable.
$MyNumber
# > 42
```

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in lab 3 - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`

---

*More Reading*

```PowerShell
Get-Help about_Automatic_Variables
Get-Help about_Environment_Variables
get-help about_Variables
```
