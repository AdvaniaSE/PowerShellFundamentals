# Lab 08. Conditions & Loops

- Get the contents of the csv file created in [lab 6](../06.%20Text%20and%20Files/Lab.md), convert it from csv to a powershell object, and store in variable `$MyUserData`

- Get all users who has an even age, and output only the name and age of those users using a `foreach` loop

- Get all users whos name starts witha vowel (AOUEIY), and output name of those users using a `while` loop

- Create a `switch` of all the users in the `$MyUserData` list and based on the colour, output:
  - Yellow = "\<Name> is living in a \<colour> submarine"
  - Purple = "\<Name> wants to see you cry in the \<colour> rain"
  - Pink = "\<Name> is building a wall"
  - Black = "\<Name> is painting a door"
  - Green = "\<Name> is an american idiot"
  - Blue = "\<Name> has a full tank of gas, half a pack of cigarettes, it's dark and he's wearing sunglasses."
  - Red = "\<Name> wants to give it away now"

- Add functionality to the switch statement
  - Change the input to only get five random members of the $MyUserData list
  - Add a default value that outputs "\<Name> needs to start a band"
  - Verify that your user ends up in the correct switch match. Edit the match statement if needed.
  - Make sure you break out of the loop as soon as it finds a match.

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in [lab  3](../03.%20Commands%20and%20Methods/Lab.md) - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`
