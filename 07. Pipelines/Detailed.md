## Lab 07. Detailed - Pipelines

- Use `Out-GridView` to get an overview of the information about a process

```PowerShell
Get-Process | Out-Gridview
```

- Use `Out-GridView`, select any process properties, output the selected information to pipeline and then format it

```PowerShell
# In order to return an object from Out-Gridview, you can use the OutputMode parameter
Get-Process | Out-Gridview -OutputMode Multiple

# And format it using, for example, Format-List
Get-Process | Out-Gridview -OutputMode Multiple | Format-List
```

---

- Find all services and filter the resulting object on only running services

```PowerShell
# Find all services and filter by only those currently running
$FilteredServices = Get-Service | Where-Object -Property Status -eq -Value 'Running'
```

- Sort the services in order of `DisplayName`

```PowerShell
# Sort the filtered services by DisplayName
$FilteredServices | Sort-Object -Property DisplayName
```

- Change the output to only show the service name, and if it can stop

```PowerShell
# Select only Name and CanStop from the filtered, sorted services
$FilteredServices | Sort-Object -Property DisplayName | Select-Object -Property Name, CanStop
```

---

*More Reading*

```PowerShell
Get-Help about_Pipelines
```
