# Lab 08. Conditions & Loops

- Get the contents of the csv file created in [lab 6](../06.%20Text%20and%20Files/Lab.md), convert it from csv to a powershell object, and store in variable `$MyUserData`

```PowerShell
$MyUserData = Get-Content -Path <path/to/MyLabFile.csv> | ConvertFrom-Csv -Delimiter ';'
```

- Get all users who has an even age, and output only the name and age of those users using a `foreach` loop

```PowerShell
## Using the % modulus operator
foreach ($User in $MyUserData) {
    if ($User.Age % 2 -eq 0) {
        Write-Output $User | Select-Object -Property Name, Age
    }
}
```

- Get all users whos name starts witha vowel (AOUEIY), and output name of those users using a `while` loop

```PowerShell
## Since a list is always indexed starting at 0, but count is indexed starting at 1, we need to add a -1 to count to get the index correct.
## We can use regex to match on many characters at the same time 
## (^ - Start of string)
## ([] - Match any character within this block)
## (. - Any character at all)
## (* - Match the previous character zero or more times)
$i = 0
while ($i -le ($MyUserData.Count -1)) {
    if ($MyUserData[$i].Name -Match '^[AOUEIY].*') {
        Write-Output $MyUserData[$i].Name
    }
    $i++
}
```

- Create a `switch` of all the users in the `$MyUserData` list and based on the color, output:

```PowerShell
Switch ($MyUserData) {
  {$_.Color -eq "Yellow"} {Write-Output "$($_.Name) is living in a $($_.Color) submarine"}
  {$_.Color -eq "Purple"} {Write-Output "$($_.Name) wants to see you cry in the $($_.Color) rain"}
  {$_.Color -eq "Pink"} {Write-Output "$($_.Name) is building a wall"}
  {$_.Color -eq "Black"} {Write-Output "$($_.Name) is painting a door"}
  {$_.Color -eq "Green"} {Write-Output "$($_.Name) is an american idiot"}
  {$_.Color -eq "Blue"} {Write-Output "$($_.Name) has a full tank of gas, half a pack of cigarettes, it's dark and he's wearing sunglasses."}
  {$_.Color -eq "Red"} {Write-Output "$($_.Name) wants to give it away now"}
}
```

- Add functionality to the switch statement

```PowerShell
# Change the input to only get five random members of the $MyUserData list
Switch ($MyUserData | Get-Random -Count 5) {

# Add a default value that outputs "\<Name> needs to start a band"
Default {Write-Output "$($_.Name) needs to start a band!"}
# Verify that your user ends up in the correct switch match. Edit the match statement if needed.
$MyName = 'Björn Sundling'
{$_.Color -eq "Yellow" -and $_.Name -ne $MyName}
# Make sure you break out of the loop as soon as it finds a match.
## Using the break keyword here would cause the entire switch run to end. We only want to end the current comparison, so instead we use the Continue keyword
{Write-Output "$($_.Name) is building a wall" ; Continue}
```

Result

```PowerShell
$MyName = 'Björn Sundling'
Switch ($MyUserData | Get-Random -Count 5) {
  {$_.Color -eq "Yellow" -and $_.Name -ne $MyName} {Write-Output "$($_.Name) is living in a $($_.Color) submarine" ; Continue}
  {$_.Color -eq "Purple" -and $_.Name -ne $MyName} {Write-Output "$($_.Name) wants to see you cry in the $($_.Color) rain" ; Continue}
  {$_.Color -eq "Pink" -and $_.Name -ne $MyName} {Write-Output "$($_.Name) is building a wall" ; Continue}
  {$_.Color -eq "Black" -and $_.Name -ne $MyName} {Write-Output "$($_.Name) is painting a door" ; Continue}
  {$_.Color -eq "Green" -and $_.Name -ne $MyName} {Write-Output "$($_.Name) is an american idiot" ; Continue}
  {$_.Color -eq "Blue" -and $_.Name -ne $MyName} {Write-Output "$($_.Name) has a full tank of gas, half a pack of cigarettes, it's dark and he's wearing sunglasses." ; Continue}
  {$_.Color -eq "Red" -and $_.Name -ne $MyName} {Write-Output "$($_.Name) wants to give it away now" ; Continue}
  Default {Write-Output "$($_.Name) needs to start a band!"}
}
```

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in [lab  3](../03.%20Commands%20and%20Methods/Lab.md) - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`

---

*More Reading*

```PowerShell
Get-Help about_While
Get-Help about_Foreach
Get-Help about_Do
Get-Help about_For
Get-Help about_Switch
```
