# Lab 06. Text

- In the folder "LabFiles" there are a number of files. One of them contains the string "purple". Using the `Select-String` command, find this file
  - *Note*: `Select-String` accepts RegEx! If your search doesn't return the expected result you might have accidently encountered a RegEx pattern

- Read the content of the found file and store it in a variable `$NewCSV`
  - Using a string method, trim any leading and trailing whitespace characters from the text
  - Using a string method or an operator, remove trailing 'M' characters
  - Replace the character "§" with a newline character

- Create a string variable called `$Me` with a text like the file created in [Lab 05](../05.%20Input%20%26%20Output/Lab.md), a comma-separated text, by combining variables in order:
  - Your name (example `$MyName` in [Lab 05](../05.%20Input%20%26%20Output/Lab.md))
  - Your age (example `$MyAge` in [Lab 05](../05.%20Input%20%26%20Output/Lab.md))
  - A color (example `$MyColor` in [Lab 04](../04.%20Variables/Lab.md))
  - A number randomly generated using a command

```PowerShell
# Examples of $Me
Björn,42,Red,1472130954
Emanuel,28,Green,1279001390
```

- Add your `$Me` string to the `$NewCSV` variable
- Output the `$NewCSV` variable to the file `MyLabFile.csv` created in [Lab 3](../03.%20Commands%20and%20Methods/Lab.md), replacing any previous content in the file

- Read or import the new content of the `MyLabFile.csv` file in a way that converts it from a string to an object, and store it in a variable called `$MyUserList`

- Use VSCode to save these commands to the PowerShell script file called `MyLabFile.ps1` in the folder created in [Lab 3](../03.%20Commands%20and%20Methods/Lab.md)
