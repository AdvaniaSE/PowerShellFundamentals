## Lab 11. Detailed - Remoting

- Use Invoke-Command to find the status of the WinRM service

```Powershell
Invoke-Command -ComputerName localhost -ScriptBlock {Get-Service -Name winrm | Select-Object -Property Name, Status}
```

Notice that the returned object also includes the remote computername and a runspaceID

```Text
Name           : winrm
Status         : Running
PSComputerName : localhost
RunspaceId     : <guid>
```

---

- Establish a PSSession and output the environment variable COMPUTERNAME

```Powershell
New-PSSession -ComputerName localhost

# If successfull, you will get the following returned
# Id Name            ComputerName    ComputerType    State         ConfigurationName     Availability
# -- ----            ------------    ------------    -----         -----------------     ------------
#  1 WinRM6          localhost       RemoteMachine   Opened        Microsoft.PowerShell     Available


Enter-PSSession -id 1
# Notice that the prompt now shows the name of the remote computer!
# [localhost]: PS C:\> 

$env:COMPUTERNAME

# Exit the PSSession
Exit-PSSession

# When done, close the session
Remove-PSSession -Id 1
```
