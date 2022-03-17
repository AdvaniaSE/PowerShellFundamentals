## Lab 06. Text

- In the folder "LabFiles" there are a number of files. One of them contains the string "purple". Using the `Select-String` Command, find this file.

- Read the contents of the found file and store it in a variable `$NewCSV`
  - Using an operator, remove any leading and trailing whitespace characters from the string
  - Using a string method or an operator, remove trailing 'N' characters.
  - Replace the character "§" with a newline character.

- Using string interpolation, recreate the "csv" from lab 5, and add a colour, and a random number, and store it in a variable `$Me`
  - The `$MyName` variable (see [lab 05](../05.%20Input%20%26%20Output/Lab.md))
  - The `$MyAge` variable  (see [lab 05](../05.%20Input%20%26%20Output/Lab.md))
  - an array of colours (see [lab 04](../04.%20Variables/Lab.md)
  - Find a command to generate a random number

```PowerShell
# example output
Björn;42;Red;1472130954
Emanuel;28;Green;1279001390
```

- Add your user data to the `$NewCSV` variable and output it to the file MyLabFile.csv created in [lab 3](../03.%20Commands%20and%20Methods/Lab.md), replace all previous contents of the file.  

- Read the new contents of the MyLabFile.csv file, convert the contents of this file from CSV to an object, and store it in variable `$MyUserList`

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in [lab  3](../03.%20Commands%20and%20Methods/Lab.md) - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`
