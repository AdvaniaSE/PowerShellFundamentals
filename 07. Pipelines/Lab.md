## Lab 07. Pipelines

- Get the contents of the csv file created in [lab 6](../06.%20Text%20and%20Files/Lab.md), convert it from csv to a powershell object, and store in variable `$MyUserData`

- Use `Out-Gridview` fo search, filter, and output all users with colour "pink", and store them in the variable `$Floyd`
  - Sort the members of `$Floyd` in order of their Id number

- Find how many users in the `$MyUserData` variable are 76 years or older.

- Group the contents of `$MyUserData` as a hashtable and store in variable `$MyColourHash`
  - find how many different colours there are.
  - Find which users share the same colour as you by expanding that colour.

- Find all users with a Id above `22000` and colour `yellow`, and sort them by age.

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in [lab  3](../03.%20Commands%20and%20Methods/Lab.md) - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`
