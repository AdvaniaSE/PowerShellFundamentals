## Lab 03. Detailed - Commands and Methods

-----------------------------------

- List all commands on your Computer

```PowerShell
Get-Command
```

---

- Open this file using notepad (or your favourite text editor)

```PowerShell
# First go to the folder where you have the lab foles downloaded
Set-Location <Path\to\downloadedFiles>
# Starting external programs from powershell can be done by calling the program directly, and notepad accepts the filename as input.
notepad .\MyLabFile.txt
```

- Find the process id of the open text editor

```PowerShell
# Find a command to get the process
Get-Command *process*

# Explore possible parameters using Get-Help
Get-Help Get-Process

# Find the Notepad process
Get-Process -Name Notepad
```

*Tip:* Note the property `Id` in the output!

- Find a command to stop a process using powershell

```PowerShell
Get-Command *process*
```

- Stop Notepad through PowerShell using the process id

```PowerShell
# Find a command to stop a process
Get-Command *process*

# Explore possible parameters using Get-Help
Get-Help Stop-Process

# Use the previously found Process id to stop notepad
Stop-Process -Id # enter your process id
```

---

- Find a command to use and rename this file to "MyLabFile.csv"

```PowerShell
# since we know what we want to do (the "verb" of the command, Rename) we can use that to search for commands
Get-Command -Verb "Rename"

# Using Get-Help examples we can find how to use the Rename-Item command
get-help Rename-Item -Examples

# and finally rename the file
Rename-Item -Path .\MyLabFile.txt -NewName "MyLabFile.csv"
```

- Find the file size of the MyLabFile.csv

```PowerShell
# Some member names in powershell can be confusingly named. For example, there is no such thing as "file size" on a file object, but instead we measure the length of the file.
(Get-Item .\MyLabFile.csv).Length
# Or we can use the CmdLet Select-Object
Get-Item .\MyLabFile.csv | Select-Object -ExpandProperty Length

# BONUS: Powershell have a lot of mathematical shorthand expressions you can use. For example you can get the file size in kilobytes using this formula
(Get-Item .\MyLabFile.csv).Length / 1KB
```

- Find a command to use and create a folder called "MyLabFiles". Remember the path to it.

```PowerShell
# In powershell we can use legacy commands as well as powershell commands. We can either create a directory the old DOS way
mkdir "MyLabFiles"

# But of course we want to do it the powershell way, using New-Item.
New-Item -Path "my/path/to/labfiles" -Name 'MyLabFiles' -ItemType Directory
```

- Find a command to use and Copy the file "MyLabFile.csv" to the "MyLabFiles" folder.

```PowerShell
# From the previous commands we know we're working with items (the Noun), and we want to copy it (the Verb), so we can right away read the help
Get-Help Copy-Item

# And run the command
Copy-Item -Path .\MyLabFile.csv -Destination '..\04. Variables\'
```

---

*More Reading*

```PowerShell
Get-Help about_Methods
Get-Help about_Properties
```
