## Lab 05. Input & Output

- Use `Read-Host` with descriptive parameters to save your name in a variable called `$MyName`.
  - Without changing the `$VerbosePreference` variable, Use `Write-Verbose` and output the variable value

- Create an empty variable of type `[int]` named `$MyAge`
  - Use `Read-Host` with descriptive parameters to save your age to the `$MyAge` variable

- Find an `Out-*` command that outputs the default stream to a file.
  - Use this command to output the `$MyName` variable to the `MyLabFile.csv` file created in [lab  3](../03.%20Commands%20and%20Methods/Lab.md) - **Without adding a newline**
  - Use the same command to append a semicolon - `;` - the the same file, again **Without adding a newline**
  - Use the same command to append the value of the `$MyAge` variable - this time also adding a newline

- Use VSCode to save these commands in a file called MyLabFile.ps1 in the folder you created in [lab  3](../03.%20Commands%20and%20Methods/Lab.md) - `Find a command to use and create a folder called "MyLabFiles". Remember the path to it.`
