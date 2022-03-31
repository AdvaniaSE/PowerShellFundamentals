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

- Create an array of colours, containing at least three different ones

```PowerShell
$MyColourArray = @('red','green','blue')
# Create another colour in a new variable called $MyColour and add it to $MyColourArray
$MyColour = 'yellow'
$MyColourArray += $MyColour

# Pick one of the colours and find it in the array
# Arrays start at 0
$MyColourArray[0]
# > red
```

- Try the same with a hashtable of three fruits with their colours as values

```PowerShell
# Hashtables have unique keys with corresponding values
# Create a hashtable with fruits as keys and their colours as values
$MyColourHashtable = @{
    'pear' = 'green'
    'apple' = 'red'
    'orange' = 'orange'
}

# Find a way to add another fruit (and its colour) to the hashtable
# $MyColour is set to 'yellow' since before
$MyColourHashtable.Add('banana', $MyColour)

# Pick one of the fruits and find its colour
$MyColourHashtable['banana']
# > yellow

# Adding another item with a non-unique key will result in an error
# In this case 'apple' already exists in the hashtable
$MyColourHashtable.Add('apple','green')
# "Item has already been added. Key in dictionary: 'apple'  Key being added: 'apple'"

# Hashtables are not ordered by default, so output may be scrambled
$MyColourHashtable
# > Name      Value
# > ----      -----
# > apple     red
# > orange    orange
# > pear      green
# > banana    yellow
```

- Create a variable and set a numerical value to it

```PowerShell
$MyNumber = 42

# Try to set the value of the variable to a string instead
$MyNumber = 'Fortytwo'

# Verify the value of the variable
$MyNumber
# > Fortytwo
```

- Create a variable of type `[int]` and try it again

```PowerShell
[int]$MyNumber = 42

# Trying to set the value to a string will now result in an error
$MyNumber = 'Fortytwo'
# > "Input string was not in a correct format."

# Verify the value of the variable
$MyNumber
# > 42
```

---

*More Reading*

```PowerShell
Get-Help about_Automatic_Variables
Get-Help about_Environment_Variables
get-help about_Variables
```
