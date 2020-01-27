## Lab 04. Detailed - Commands and Methods

- List Commands on the Computer

```Powershell
Get-Command
```

---

- How many commands are there on your computer?

```Powershell
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

```Powershell
# Starting external programs from powershell can be done by calling the program directly
notepad
```

---

- Find the Process ID of Notepad

```Powershell
# Find a command to get the process
Get-Command *process*

# Explore possible parameters using Get-Help
Get-Help Get-Process

# Find the Notepad process
Get-Process -Name Notepad
# Note the column 'Id' in the output
```

---

- Find a Command to Stop a Process

```Powershell
Get-Command *process*
```

---

- Stop Notepad through PowerShell using the Process ID

```Powershell
# Find a command to stop a process
Get-Command *process*

# Explore possible parameters using Get-Help
Get-Help Stop-Process

# Use the previously found Process id to stop notepad
Stop-Process -Id # enter your process id
```

---

- Start Notepad through PowerShell

```Powershell
notepad
```

---

- What is the path to the notepad process executable?

```Powershell
# Find the Notepad process and store it in a variable
$MyProcess = Get-Process -Name Notepad

# Examine possible methods that can provide the path
Get-Member -InputObject $MyProcess

# Call the path property
$MyProcess.Path
```

---

- What type is the process?

```Powershell
# Find the Notepad process and store it in a variable
$MyProcess = Get-Process -Name Notepad

# There are two ways of finding the type of a PowerShell object. 
# Run Get-Member, and find the top line of the output
Get-Member -InputObject $MyProcess

# Or invoke the GetType() method on an object
$MyProcess.GetType()
```

---

- Find a Method to Stop a Process, and stop Notepad through PowerShell using the Method

```Powershell
# Find the Notepad process and store it in a variable
$MyProcess = Get-Process -Name Notepad

# Examine possible methods that can stop a process
Get-Member -InputObject $MyProcess

# You can either call the kill method
$MyProcess.Kill()

# Or the CloseMainWindow method
$MyProcess.CloseMainWindow()
```

*Tip*: While the Close method on a process might seem logic at first, this method is actually used to free resources after a process has exited.

---

*More Reading*

```Powershell
Get-Help about_Methods
Get-Help about_Properties
```
