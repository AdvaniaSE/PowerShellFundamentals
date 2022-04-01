# Lab 03. Detailed - Commands and Methods

- List all commands on your Computer

```PowerShell
Get-Command
```

---

- Open this file using notepad (or your favorite text editor)

```PowerShell
# First go to the folder where you have the lab files downloaded
Set-Location <path\to\downloadedFiles>

# PowerShell can start programs by calling the program directly, and notepad accepts the filename as input
notepad .\MyLabFile.txt
```

- Find the process id of the open text editor

```PowerShell
# Find a command to get the process
Get-Command *process*

# Explore possible parameters using Get-Help
Get-Help Get-Process

# Find the Notepad process (or chosen text editor)
Get-Process -Name Notepad
```

*Tip:* Note the property `Id` in the output!

- Find a command to stop a process using PowerShell

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
Stop-Process -Id <your-process-id>
```

---

- Find a command to rename the file to "MyLabFile.csv"

```PowerShell
# since we know what we want to do (the "verb" of the command, Rename) we can use that to search for commands
Get-Command -Verb "Rename"

# Using Get-Help examples we can find how to use the Rename-Item command
Get-Help Rename-Item -Examples

# and finally rename the file
Rename-Item -Path .\MyLabFile.txt -NewName "MyLabFile.csv"
```

- Find the file size of the MyLabFile.csv

```PowerShell
# Some properties in PowerShell are named differently than expected. For example there is no such thing as "file size" on a file object, instead there is a length property
(Get-Item .\MyLabFile.csv).Length

# We can also use the Select-Object command
Get-Item .\MyLabFile.csv | Select-Object -ExpandProperty Length

# PowerShell has a lot of mathematical expressions that you can use
# For example we can get the file size in kilobytes using this formula
(Get-Item .\MyLabFile.csv).Length / 1KB
```

- Find a command to use, then create a folder called "MyLabFiles". Remember the path to it.

```PowerShell
# In powershell we can use legacy commands as well as powershell commands. We can either create a directory the old DOS way
mkdir "MyLabFiles"

# But of course we want to do it the powershell way, using New-Item.
New-Item -Path "my/path/to/labfiles" -Name 'MyLabFiles' -ItemType Directory
```

- Find a command to use, then copy the file "MyLabFile.csv" to the "MyLabFiles" folder.

```PowerShell
# We know the Noun to work with (Item) and the Verb to use (Copy), so we can look at the help of the command
Get-Help Copy-Item

# After reading the help we know how to use the command
Copy-Item -Path .\MyLabFile.csv -Destination 'my/path/to/labfiles'
```

---

*More Reading*

```PowerShell
Get-Help about_Methods
Get-Help about_Properties
```
