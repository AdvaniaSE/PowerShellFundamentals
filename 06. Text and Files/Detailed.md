## Lab 08. Text

- In the folder "LabFiles" there are a number of files. One of them contains the string "purple". Using the `Select-String` Command, find this file.

```PowerShell
Get-ChildItem -Path .\LabFiles\ -Recurse | Select-String -Pattern 'purple'
# > LabFiles\BDTHDIHJZT.txt:1:<cut for brevity>

# Remember: Select-String accepts regex. If your search doesn't return the expected result you might have accidently encountered a regex pattern
```

- Read the contents of the found file and store it in a variable `$NewCSV`

```PowerShell
## The *Content commands are great to use when reading and writing files. To find them, run the command
Get-Command -Noun Content

$NewCSV = Get-Content .\LabFiles\BDTHDIHJZT.txt

# Using an operator, remove any leading and trailing whitespace characters from the string
## In powershell you can re-use a variable by assigning it to itself.
## The Trim() methods with no parameters removes whitespace characters (space and tab)
$NewCSV = $NewCSV.Trim()

# Using a string method or an operator, remove trailing 'N' characters.
## Method - Accepts zero, one, or a list of characters to remove.
$NewCSV = $NewCSV.TrimEnd('N')
## Operator - Accepts regex: 
## 'N' - Character 'N'
## * - Quantifier: Matches previous character zero or more times
## $ - End of line
$NewCSV = $NewCSV -Replace 'N*$',''

# Replace the character "§" with a newline character.
## The PowerShell escape character is a backtick "`". We can use this for many different find and replace tokens, such as tab "`t" and newline "`n".
## Note: Since we need to expand the escape sequence we need to use double quotes. Using single quotes will cause it to be replaced by the literal characters `n. 
$NewCSV = $NewCSV.Replace('§',"`n")
# Or using operator
$NewCSV = $NewCSV -replace '§',"`n"
```

- Using string interpolation, recreate the "csv" from lab 5, and add a colour, and a random number, and store it in a variable `$Me`

```PowerShell
$Me = "$MyName;$MyAge;$($MyColours[0]);$(Get-Random)"
$Me
# > Björn Sundling;42;Red;1472130954
## Or
$Me = '{0};{1};{2};{3}' -f 'Emanuel Palm', 28, $MyColours[1], (Get-Random)
$Me
# > Emanuel Palm;28;green;1436090893
```

- Add your user data to the `$NewCSV` variable and output it to the file MyLabFile.csv created in [lab 3](../03.%20Commands%20and%20Methods/Lab.md), replace all previous contents of the file.  

```PowerShell
# Add yourself to the list
$NewCSV += $Me

# Output it to the file, overwriting previous content
Set-Content -Path <path/to/MyLabFile.csv> -Value $NewCSV
# Or using Out-File
$NewCSV | Out-File -FilePath <path/to/MyLabFile.csv>
```

- Read the new contents of the MyLabFile.csv file, convert the contents of this file from CSV to an object, and store it in variable `$MyUserList`

```PowerShell
## Again we use the content commands to get the file content.
## ConvertFrom-CSV Defaults to using comma "," as delimiter, but swedish standards is semicolon ";", so we need to specify which character to use.
$MyUserList = Get-Content <path/to/MyLabFile.csv> | ConvertFrom-Csv -Delimiter ';'
$MyUserList
# > Name            Age Colour Id
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

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in [lab  3](../03.%20Commands%20and%20Methods/Lab.md) - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`
