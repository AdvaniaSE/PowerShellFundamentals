## Megalab - Detailed

A collection of extra, more complex labs.

- Find all installed PowerShell modules greater than 500kb in total directory size of the module folder and create a csv report containing each module name, path and size in kb

There are many ways to do this in PowerShell.
One possible solution can be found in the file "EnumerateModuleFolders.ps1" in the folder "SolutionFiles".

---

- Windows
    - Get all logon events from your computer's event log, optionally filter on failed attempts

```PowerShell
# Use Get-WinEvent to find information on events in Windows
Get-WinEvent
```

- Linux or MacOS?
    - Please teach us!

---

- Windows
    - Create a csv report with the following information from your computer:
        - Manufacturer
        - OS Version
        - Serial Number
        - BIOS Version
        - Total RAM
        - Number of Disk Partitions
        - TPM Status (Enabled/Disabled)

Just like with finding folders, there are many ways of getting computer information in PowerShell
One possible solution can be found in the file "CSVReport.ps1" in the folder "SolutionFiles".

- Linux or MacOS?
  - Please teach us!

---

- Bring your own lab!
    - Bring something that you want to show, need help with or have questions about!
