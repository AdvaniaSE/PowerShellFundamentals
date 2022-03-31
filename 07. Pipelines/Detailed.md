# Lab 07. Pipelines

- Get the contents of the csv file created in [lab 6](../06.%20Text%20and%20Files/Lab.md), convert it from csv to a powershell object, and store in variable `$MyUserData`

```PowerShell
$MyUserData = Get-Content -Path <path/to/MyLabFile.csv> | ConvertFrom-Csv -Delimiter ';'
```

- Use `Out-Gridview` fo search, filter, and output all users with color "pink", and store them in the variable `$Floyd`

```PowerShell
## The -Title parameter is not required, but makes it easier to know what you're looking for.
$Floyd = $MyUserData | Out-GridView -Title 'Animals' -OutputMode Multiple 

# Sort the members of $Floyd in order of their Id number
$Floyd | Sort-Object -Property Id
# > Name           Age Color Id
# > ----           --- ------ --
# > Nick Mason     78  Pink   1130
# > Roger Waters   78  Pink   20122335
# > David Gilmour  76  Pink   210865668
# > Richard Wright 78  Pink   3665770
# > Syd Barrett    76  Pink   72025

## If powerShell interprets a value "wrong", for example Id is here a string, and sorted wrong, we can force it to be interpreted as int by using explicit typecasting
$Floyd | Sort-Object {[int]$_.Id}
# > Name           Age Color Id
# > ----           --- ------ --
# > Nick Mason     78  Pink   1130
# > Syd Barrett    76  Pink   72025
# > Richard Wright 78  Pink   3665770
# > Roger Waters   78  Pink   20122335
# > David Gilmour  76  Pink   210865668
```

- Find how many users in the `$MyUserData` variable are 76 years or older.

```PowerShell
## The "math" principles allows us to run things in parenthesis to first perform the filtering, then expand the count property.
($MyUserData | Where-Object -Property Age -ge 76).Count
```

- Group the contents of `$MyUserData` as a hashtable and store in variable `$MyColorHash`

```PowerShell
$MyColorHash = $MyUserData | Group-Object -AsHashTable -Property Color

# find how many different colors there are.
## Since we grouped it by the color property we can simply see how many there are in our list.
$MyColorHash.count
# > 7

# Find which users share the same color as you by expanding that color.
$MyColorHash['Red']
# > Name            Age Color Id
# > ----            --- ------ --
# > Mick Hucknall   61  red    57624134
# > Björn Sundling  42  Red    1472130954
```

- Find all users with a Id above `22000` and color `yellow`, and sort them by age.

```PowerShell
## You can have as many filters in one Select-Object as you need. A common way of keeping it readable is writing each statement on a new line
## Just like with the sorting we need to explicitly cast the Id as int or we wont get all the results.
$MyUserData | Where-Object {
    [int]$_.id -gt 22000 -and 
    $_.Color -eq 'yellow'
} | Sort-Object -Property Age
```

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in [lab  3](../03.%20Commands%20and%20Methods/Detailed.md) - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`

---

*More Reading*

```PowerShell
Get-Help about_Pipelines
```
