# Lab 07. Pipelines

- Get the content of the `MyLabFile.csv` file created in [Lab 6](../06.%20Text%20and%20Files/Lab.md), convert it from CSV to a list of objects in PowerShell, and store it in variable `$MyUserList`

```PowerShell
$MyUserList = Import-Csv -Path <path/to/MyLabFile.csv>
```

- Use the command `Out-GridView` to search, filter, and output all users with the color `Pink`, and store them in the variable `$Floyd`

```PowerShell
# The -Title parameter is not required, but makes it easier to know what you're looking for.
$Floyd = $MyUserList | Out-GridView -Title 'Animals' -OutputMode Multiple 

# Sort the members of $Floyd in order of their Id
$Floyd | Sort-Object -Property Id
# > Name           Age Color Id
# > ----           --- ----- --
# > Nick Mason     78  Pink  1130
# > Roger Waters   78  Pink  20122335
# > David Gilmour  76  Pink  210865668
# > Richard Wright 78  Pink  3665770
# > Syd Barrett    76  Pink  72025

# PowerShell is interpreting the Id as a string, which sorts it incorrectly
# To fix this we can explicitly cast the Id to an integer which will sort it as expected
$Floyd | Sort-Object { [int]$_.Id }
# > Name           Age Color Id
# > ----           --- ------ --
# > Nick Mason     78  Pink   1130
# > Syd Barrett    76  Pink   72025
# > Richard Wright 78  Pink   3665770
# > Roger Waters   78  Pink   20122335
# > David Gilmour  76  Pink   210865668
```

- Find how many users in the `$MyUserList` variable are 76 years or older.

```PowerShell
# PowerShell's operator precedence allows us to put things in parentheses to first evaluate the filtering, then expand the count property
($MyUserList | Where-Object -Property Age -ge 76).Count
```

- Group `$MyUserList` by color as a hashtable and store it in a variable called `$MyUserHashtable`
  - Find how many different colors there are in the hashtable
  - Find which users share the color `Red` by expanding that color

```PowerShell
$MyUserHashtable = $MyUserList | Group-Object -AsHashTable -Property Color

# The Count property shows us how many different colors there are
$MyUserHashtable.Count
# > 7

# Find which users share the color Red
$MyUserHashtable['Red']
# > Name                 Age Color Id
# > ----                 --- ----- --
# > Anthony Kiedis       59  Red   14015291
# > Michael Flea Balzary 59  Red   94
# > Chad Smith           60  Red   463418
# > John Frusciante      52  Red   1293
```

- Find all users with an Id above `22000` and the color `Yellow`, and sort them by age

```PowerShell
# We can use the command Where-Object with as many filters as needed, using several lines to keep it readable
# By putting 22000 on the left side of the comparison, PowerShell will try to compare the Id as an integer
$MyUserList | Where-Object {
    22000 -lt $_.Id -and 
    $_.Color -eq 'Yellow'
} | Sort-Object -Property Age
# > Name            Age Color  Id
# > ----            --- -----  --
# > Paul McCartney  79  Yellow 31654
# > George Harrison 79  Yellow 181121
# > John Lennon     81  Yellow 262327777
# > Ringo Starr     81  Yellow 242779641

# If we were to reverse the Id comparison and put the Id on the left side without casting it to an integer, some users would be filtered out unintentionally because PowerShell would interpret the Id as a string
$MyUserList | Where-Object {
    $_.Id -gt 22000 -and 
    $_.Color -eq 'Yellow'
} | Sort-Object -Property Age
# > Name           Age Color  Id
# > ----           --- -----  --
# > Paul McCartney 79  Yellow 31654
# > John Lennon    81  Yellow 262327777
# > Ringo Starr    81  Yellow 242779641
```

- Use VSCode to save these commands to the PowerShell script file called `MyLabFile.ps1` in the folder created in [Lab 3](../03.%20Commands%20and%20Methods/Detailed.md)

---

*More Reading*

```PowerShell
Get-Help about_Pipelines
Get-Help about_Operator_Precedence
```
