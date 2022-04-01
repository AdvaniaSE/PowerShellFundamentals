# Lab 05. Input & Output

- Use `Read-Host` to save your age as a number to a variable called `$Age`
    - Use `$Age` to calculate your birth year and print it to the console
- Use `Read-Host` to save secure input using a parameter
- Run a non working command such as `Get-FakeCommand`
    - Explore the error message
    - Change `$ErrorActionPreference` to "SilentlyContinue" and try again
    - Restore the `$ErrorActionPreference` to its default setting
- Try using both `Write-Host` and `Write-Output` and saving the results to a variable
    - What is the difference?
    - Why does it happen?