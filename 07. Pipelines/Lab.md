# Lab 07. Pipelines

- Get the content of the `MyLabFile.csv` file created in [Lab 6](../06.%20Text%20and%20Files/Lab.md), convert it from CSV to a list of objects in PowerShell, and store it in variable `$MyUserList`

- Use the command `Out-GridView` to search, filter, and output all users with the color `Pink`, and store them in the variable `$Floyd`
  - Sort the members of `$Floyd` in order of their Id

- Find how many users in the `$MyUserList` variable are 76 years or older.

- Group `$MyUserList` by color as a hashtable and store in variable `$MyColorHash`
  - Find how many different colors there are in the hashtable
  - Find which users share the color `Blue` by expanding that color

- Find all users with an Id above `22000` and the color `Yellow`, and sort them by age.

- Use VSCode to save these commands to the PowerShell script file called `MyLabFile.ps1` in the folder created in [Lab 3](../03.%20Commands%20and%20Methods/Lab.md)
