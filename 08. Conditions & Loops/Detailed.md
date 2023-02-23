# Lab 08. Conditions & Loops

- Get the content of the `MyLabFile.csv` file created in [Lab 6](../06.%20Text%20and%20Files/Lab.md), convert it from CSV to a list of objects in PowerShell, and store it in variable `$MyUserList`

```PowerShell
$MyUserList = Import-Csv -Path <path/to/MyLabFile.csv>
```

- Using a `foreach` loop, get only the name and age of users who are between 50 and 70 years old

```PowerShell
# The foreach keyword lets us loop over all members in a list
foreach ($User in $MyUserList) {
    # We can compare the age of the user to a range, and only output those users
    if ($User.Age -ge 50 -and $User.Age -le 70) {
        $UserInfo = $User | Select-Object -Property Name, Age
        Write-Output $UserInfo
    }
}
```

- Use a `while` loop with a condition to only loop until the first user with the color `Red` is found

```PowerShell
# Set a count to 0 to find the first user
$UserCount = 0
# Only loop while the current user does not have the color Red
while ($User.Color -ne "Red") {
    # Set the user to based on the current count
    $User = $MyUserList[$UserCount]
    # Increment the count
    $UserCount++
}

$UserCount
# > 20

$User
# > Name           Age Color Id
# > ----           --- ----- --
# > Anthony Kiedis 59  Red   14015291
```

- Pick a single user from `$MyUserList` and store it in a variable called `$MyUser`
- Create a `switch` and output the following based on the color of `$MyUser`
  - Yellow = "\<Name> is living in a \<Color> submarine"
  - Purple = "\<Name> wants to see you cry in the \<Color> rain"
  - Pink = "\<Name> is building a wall"
  - Black = "\<Name> is painting a door"
  - Green = "\<Name> went on a holiday"
  - Blue = "\<Name> has a full tank of gas, half a pack of cigarettes, it's dark and he's wearing sunglasses"
  - Red = "\<Name> wants to give it away now"

```PowerShell
# If you can't choose a user, pick one at random
$RandomUserIndex = Get-Random -Minimum 0 -Maximum $MyUserList.Count
$MyUser = $MyUserList[$RandomUserIndex]

# Specify the color property in the switch statement
# Create cases for each color
switch ($MyUser.Color) {
  "Yellow" { "$($MyUser.Name) is living in a $($MyUser.Color) submarine." }
  "Purple" { "$($MyUser.Name) wants to see you cry in the $($MyUser.Color) rain." }
  "Pink" { "$($MyUser.Name) is building a wall." }
  "Black" { "$($MyUser.Name) is painting a door." }
  "Green" { "$($MyUser.Name) went on a holiday." }
  "Blue" { "$($MyUser.Name) has a full tank of gas, half a pack of cigarettes, it's dark and he's wearing sunglasses." }
  "Red" { "$($MyUser.Name) wants to give it away now." }
}
```

- Adapt the switch statement to work on the entire list of users instead of just one user

```PowerShell
# When looping over a list, comparisons are made in a scriptblock with $_ as the current item in the list
switch ($MyUserList) {
    { $_.Color -eq 'Yellow' } { "$($_.Name) is living in a $($_.Color) submarine." }
    { $_.Color -eq 'Purple' } { "$($_.Name) wants to see you cry in the $($_.Color) rain." }
    { $_.Color -eq 'Pink' } { "$($_.Name) is building a wall." }
    { $_.Color -eq 'Black' } { "$($_.Name) is painting a door." }
    { $_.Color -eq 'Green' } { "$($_.Name) went on a holiday." }
    { $_.Color -eq 'Blue' } { "$($_.Name) has a full tank of gas, half a pack of cigarettes, it's dark and he's wearing sunglasses." }
    { $_.Color -eq 'Red' } { "$($_.Name) wants to give it away now." }
}
```

- Add a default case that outputs "\<Name> needs to start a band", and remove one of the cases in the `switch` statement to verify that some users now need to start bands

```PowerShell
# A user will fall into the default case if no other condition is met
# Removing the Red condition will make users with the color Red fall into the default case
switch ($MyUserList) {
    { $_.Color -eq 'Yellow' } { "$($_.Name) is living in a $($_.Color) submarine." }
    { $_.Color -eq 'Purple' } { "$($_.Name) wants to see you cry in the $($_.Color) rain." }
    { $_.Color -eq 'Pink' } { "$($_.Name) is building a wall." }
    { $_.Color -eq 'Black' } { "$($_.Name) is painting a door." }
    { $_.Color -eq 'Green' } { "$($_.Name) went on a holiday." }
    { $_.Color -eq 'Blue' } { "$($_.Name) has a full tank of gas, half a pack of cigarettes, it's dark and he's wearing sunglasses." }
    # { $_.Color -eq 'Red' } { "$($_.Name) wants to give it away now." }
    default { "$($_.Name) needs to start a band!" }
}
```

- Use VSCode to save these commands to the PowerShell script file called `MyLabFile.ps1` in the folder created in [Lab 3](../03.%20Commands%20and%20Methods/Detailed.md)

---

*More Reading*

```PowerShell
Get-Help about_While
Get-Help about_Foreach
Get-Help about_Do
Get-Help about_For
Get-Help about_Switch
Get-Help about_Break
Get-Help about_Continue
Get-Help about_comparison_operators
```
