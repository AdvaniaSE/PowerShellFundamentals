## Lab 07. Detailed - Pipelines

- Use Out-GridView to select information about a process

```Powershell
Get-Process | Out-Gridview
```

---

- Use Out-GridView, select process information and output the selected information to pipeline, and format it

```Powershell
# In order to return an object from Out-Gridview, you can use the OutputMode parameter
Get-Process | Out-Gridview -OutputMode Multiple

# And format it using, for example, Format-List
Get-Process | Out-Gridview -OutputMode Multiple | Format-List
```

---

- Find all services and filter the resulting object on only running services

```Powershell
Get-Service | Where-Object -Property Status -EQ -Value 'Running'

# Sort the resulting object in order of DisplayName
Get-Service | Where-Object -Property Status -EQ -Value 'Running' | Sort-Object -Property DisplayName

# Change the output to only show the service name, and if it can stop
Get-Service | Where-Object -Property Status -EQ -Value 'Running' | Sort-Object -Property DisplayName | Select-Object -Property Name, CanStop
```

---

*Get-Help*

```Powershell
Get-Help about_Pipelines
```
