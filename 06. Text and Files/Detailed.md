# Lab 06. Text

- In the folder "LabFiles" there are a number of files. One of them contains the string "purple". Using the `Select-String` command, find this file
  - *Info*: `Select-String` accepts RegEx! If your search doesn't return the expected result you might have accidently encountered a RegEx pattern

```PowerShell
Get-ChildItem -Path .\LabFiles | Select-String -Pattern 'purple'
# > LabFiles\BDTHDIHJZT.txt:1:<cut for brevity>
```

- Read the content of the found file and store it in a variable `$NewCSV`

```PowerShell
# The *-Content commands are great to use when reading from and writing to files
Get-Command -Noun Content

# Use the file path found before
$NewCSV = Get-Content .\LabFiles\BDTHDIHJZT.txt

# Using a string method, trim any leading and trailing whitespace characters from the text
# In powershell you can overwrite a variable by assigning it to itself.
# Using the Trim* methods without parameters removes whitespace characters (spaces and tabs) and outputs the result, so we need to save it to the variable
$NewCSV = $NewCSV.Trim()

# Using a string method or an operator, remove trailing 'M' characters
# Method - Accepts zero, one, or a list of characters to remove
$NewCSV = $NewCSV.TrimEnd('M')

# Operator - Accepts regex: 
# M - Character M
# * - Quantifier: Matches previous character zero or more times
# $ - End of line
# '' - Replaces with empty string
$NewCSV = $NewCSV -replace 'N*$',''

# Replace the character "§" with a newline character
# The PowerShell escape character is a backtick "`". We can use this for special characters in text, such as the tab "`t" or newline "`n" characters
# Note: We need to use double quotes to be able to use the special characters, using single quotes will interpret it as the literal characters `n
$NewCSV = $NewCSV.Replace('§',"`n")
# Or using the -replace operator
$NewCSV = $NewCSV -replace '§',"`n"
```

- Create a string variable called `$Me` with a text like the file created in [Lab 05](../05.%20Input%20%26%20Output/Detailed.md), a comma-separated text, by combining variables in order:
  - Your name (example `$MyName` in [Lab 05](../05.%20Input%20%26%20Output/Detailed.md))
  - Your age (example `$MyAge` in [Lab 05](../05.%20Input%20%26%20Output/Detailed.md))
  - A color (example `$MyColor` in [Lab 04](../04.%20Variables/Detailed.md))
  - A number randomly generated using a command

```PowerShell
# Get a random number using Get-Random
$MyRandomNumber = Get-Random

# Using the variables in a double-quoted string
$Me = "$MyName,$MyAge,$MyColor,$MyRandomNumber"

$Me
# > Björn Sundling,42,red,1472130954

# There are several ways to combine strings
# Adding strings together
$Me = $MyName + ',' + $MyAge + ',' + $MyColor + ',' + $MyRandomNumber

# Using the -join operator
$Me = $MyName,$MyAge,$MyColor,$MyRandomNumber -join ','

# Joining a list of strings using Join-String (PowerShell 7+)
$Me = $MyName,$MyAge,$MyColor,$MyRandomNumber | Join-String -Separator ','

# Using the string format -f operator
$Me = '{0},{1},{2},{3}' -f $MyName,$MyAge,$MyColor,$MyRandomNumber
```

- Add your `$Me` string to the `$NewCSV` variable
- Output the `$NewCSV` variable to the file `MyLabFile.csv` created in [Lab 3](../03.%20Commands%20and%20Methods/Detailed.md), replacing any previous content in the file

```PowerShell
# Add yourself to the list
$NewCSV += $Me

# Output it to the file using Set-Content, overwriting previous content
Set-Content -Path <path/to/MyLabFile.csv> -Value $NewCSV

# Or using Out-File
$NewCSV | Out-File -FilePath <path/to/MyLabFile.csv>
```

- Read or import the new content of the `MyLabFile.csv` file in a way that converts it from a string to an object, and store it in a variable called `$MyUserList`

```PowerShell
# Piping the content to ConvertFrom-Csv converts the comma-separated text to a list of objects
$MyUserList = Get-Content <path/to/MyLabFile.csv> | ConvertFrom-Csv

# We can also use Import-Csv
$MyUserList = Import-Csv <path/to/MyLabFile.csv>

$MyUserList
# > Name            Age Color Id
# > ----            --- ------ --
# > John Lennon     81  Yellow 262327777
# > Paul McCartney  79  Yellow 31654
# > Ringo Starr     81  Yellow 242779641
# > George Harrison 79  Yellow 181121
# > Charlie Watts   80  Black  1862506751
# > Ronnie Wood     74  Black  12
# > Mick Jagger     78  Black  276103
# > Keith Richards  78  Black  182392
# > Prince          63  Purple 1503892
# > David Gilmour   76  Pink   210865668
# > Nick Mason      78  Pink   1130
# > Roger Waters    78  Pink   20122335
# > Richard Wright  78  Pink   3665770
# > Syd Barrett     76  Pink   72025
# > Björn Sundling  42  Red    1472130954
# > Emanuel Palm    28  green  1436090893
```

- Use VSCode to save these commands to the PowerShell script file called `MyLabFile.ps1` in the folder created in [Lab 3](../03.%20Commands%20and%20Methods/Detailed.md)

---

*More Reading*

```PowerShell
Get-Help about_Quoting_Rules
Get-Help about_Comparison_Operators
Get-Help about_Regular_Expressions
```

RegEx:
[Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
[regex101.com](https://regex101.com/)

```PowerShell
Get-Help about_Core_Commands
Get-Help about_Providers
Get-Help about_*Provider
```
