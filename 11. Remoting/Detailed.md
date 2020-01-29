## Lab 11. Detailed - Remoting

- Use `Invoke-Command` to find the status of the WinRM service

```PowerShell
Invoke-Command -ComputerName localhost -ScriptBlock {Get-Service -Name winrm | Select-Object -Property Name, Status}
```

Notice that the returned object also includes the remote computername and a runspace id.

```Text
Name           : winrm
Status         : Running
PSComputerName : localhost
RunspaceId     : <guid>
```

---

- Establish a PSSession and output the environment variable `COMPUTERNAME`

```PowerShell
New-PSSession -ComputerName localhost

# If successful, you will get the following information:
# Id Name            ComputerName    ComputerType    State         ConfigurationName     Availability
# -- ----            ------------    ------------    -----         -----------------     ------------
#  1 WinRM6          localhost       RemoteMachine   Opened        Microsoft.PowerShell     Available


Enter-PSSession -Id 1
# Notice that the prompt now shows the name of the remote computer!
# [localhost]: PS C:\> 

$env:COMPUTERNAME

# Exit the PSSession
Exit-PSSession

# When done, close the session
Remove-PSSession -Id 1
```

*More Reading*

```PowerShell
Get-Help Enable-PSRemoting
```