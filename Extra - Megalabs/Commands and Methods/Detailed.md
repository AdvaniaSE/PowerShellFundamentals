# Lab 03. Detailed - Commands and Methods

- List all commands on your Computer

```PowerShell
Get-Command
```

---

- How many commands are there on your computer?

```PowerShell
# First, get the properties and methods available on an Array
$MyCommands = Get-Command

# Examine possible methods that can provide the amount of objects in an array
Get-Member -InputObject $MyCommands

# Call the count or length property
$MyCommands.Count
$MyCommands.Length

```

---

- Start Notepad through PowerShell

```PowerShell
# Starting external programs from powershell can be done by calling the program directly
notepad
```

- Find the process id of Notepad

```PowerShell
# Find a command to get the process
Get-Command *process*

# Explore possible parameters using Get-Help
Get-Help Get-Process

# Find the Notepad process
Get-Process -Name Notepad
```

*Tip:* Note the property `Id` in the output!

- Find a command to stop a process

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

- Start Notepad through PowerShell

```PowerShell
notepad
```

- What is the path to the notepad process executable?

```PowerShell
# Find the Notepad process and store it in a variable
$MyProcess = Get-Process -Name Notepad

# Examine possible methods that can provide the path
Get-Member -InputObject $MyProcess

# Call the path property
$MyProcess.Path
```

- What type is the process?

```PowerShell
# Find the Notepad process and store it in a variable
$MyProcess = Get-Process -Name Notepad

# There are two ways of finding the type of a PowerShell object. 
# Run Get-Member, and find the top line of the output
Get-Member -InputObject $MyProcess

# Or invoke the GetType() method on an object
$MyProcess.GetType()
```

- Find a method to stop a process

```PowerShell
# Find the Notepad process and store it in a variable
$MyProcess = Get-Process -Name 'Notepad'

# Examine possible methods that can stop a process
Get-Member -InputObject $MyProcess
```

- Stop Notepad through PowerShell using the method

```PowerShell
# You can either call the kill method
$MyProcess.Kill()

# Or the CloseMainWindow method
$MyProcess.CloseMainWindow()
```

*Tip:* While the `Close` method on a process might seem fitting, it's actually used to free resources after a process has exited.

---

*More Reading*

```PowerShell
Get-Help about_Methods
Get-Help about_Properties
```
