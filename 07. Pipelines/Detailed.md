## Lab 07. Detailed - Pipelines

- Use `Out-GridView` to get an overview of the information about a process

```Powershell
Get-Process | Out-Gridview
```

- Use `Out-GridView`, select any process properties, output the selected information to pipeline and then format it

```Powershell
# In order to return an object from Out-Gridview, you can use the OutputMode parameter
Get-Process | Out-Gridview -OutputMode Multiple

# And format it using, for example, Format-List
Get-Process | Out-Gridview -OutputMode Multiple | Format-List
```

---

- Find all services and filter the resulting object on only running services
    - Sort the result in order of DisplayName
    - Change the output to only show the service name, and if it can stop

```Powershell
# Filter the result by only running services
Get-Service | Where-Object -Property Status -eq -Value 'Running'

# Sort the filtered services by DisplayName
Get-Service | Where-Object -Property Status -eq -Value 'Running' | 
Sort-Object -Property DisplayName

# Select only Name and CanStop from the filtered, sorted services
Get-Service | Where-Object -Property Status -eq -Value 'Running' | Sort-Object -Property DisplayName | Select-Object -Property Name, CanStop
```

---

*More Reading*

```Powershell
Get-Help about_Pipelines
```
