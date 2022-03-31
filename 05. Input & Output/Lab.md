# Lab 05. Input & Output

- Use `Read-Host` with a descriptive question to save your name in a variable called `$MyName`
- Try to output the variable to different streams using some of the `Write-*` commands
  - `Write-Host`
  - `Write-Error`
  - `Write-Information`
  - `Write-Verbose`
- Modify the preference variables of the streams to reverse the behavior, instead displaying or hiding the output

---

- Create an variable of type `[int]` named `$MyAge` with the value of 0
  - Use `Read-Host` with a descriptive question to save your age to the variable as a number
  - Try it again but this time as a string
  - Verify the variable value

---

- Find an `Out-*` command that outputs to a file
  - Use the command to output the value of `$MyName` to the `MyLabFile.csv` file created in [Lab  3](../03.%20Commands%20and%20Methods/Lab.md) **without adding a newline**
  - Use the command to append a comma `","` to the same file, again **without adding a newline**
  - Use the command to append the value of `$MyAge`, **this time adding a newline**

- Use VSCode to save these commands to the PowerShell script file called `MyLabFile.ps1` in the folder created in [Lab 3](../03.%20Commands%20and%20Methods/Lab.md)
