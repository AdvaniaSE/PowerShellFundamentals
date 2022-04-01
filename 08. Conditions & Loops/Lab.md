# Lab 08. Conditions & Loops

- Get the content of the `MyLabFile.csv` file created in [Lab 6](../06.%20Text%20and%20Files/Lab.md), convert it from CSV to a list of objects in PowerShell, and store it in variable `$MyUserList`

- Using a `foreach` loop (not `ForEach-Object`), get only the name and age of users who are between 50 and 70 years old

- Use a `while` loop with a condition to only loop until the first user with the color `Red` is found

- Pick a single user from `$MyUserList` and store it in a variable called `$MyUser`
- Create a `switch` and output the following based on the color of `$MyUser`
  - Yellow = "\<Name> is living in a \<Color> submarine."
  - Purple = "\<Name> wants to see you cry in the \<Color> rain."
  - Pink = "\<Name> is building a wall."
  - Black = "\<Name> is painting a door."
  - Green = "\<Name> went on a holiday."
  - Blue = "\<Name> has a full tank of gas, half a pack of cigarettes, it's dark and he's wearing sunglasses."
  - Red = "\<Name> wants to give it away now."

- Adapt the switch statement to work on the entire list of users instead of just one user
- Add a default case that outputs "\<Name> needs to start a band", and remove one of the cases in the `switch` statement to verify that some users now need to start bands  

- Use VSCode to save these commands to the PowerShell script file called `MyLabFile.ps1` in the folder created in [Lab 3](../03.%20Commands%20and%20Methods/Lab.md)
