## Lab 08. Detailed - PSDrives

- Create an empty folder on your harddrive called 'c:\PWSHLab\'

```Powershell
New-Item -Path c:\PWSHLab -ItemType Directory
```

- Create a empty text file called pwshtestfile.txt inside the PWSHLab folder

```Powershell
Set-Location -Path C:\PWSHLab\
New-Item -Name pwshtestfile.txt -ItemType File
```

- Use powershell to edit the contents of the file

```Powershell
Set-Content -Path .\pwshtestfile.txt -Value 'hello world'
```

- Using the core commands, verify the CreationTime and LastWriteTime of the file

```Powershell
 Get-ItemProperty -Path .\pwshtestfile.txt -Name CreationTime, LastWriteTime
```

- Create a subfolder inside the PWSHLab folder

```Powershell
New-Item -Name folder -ItemType Directory
```

---

- Create a new registry key in the HKEY_CURRENT_USER store called PWSHLab

```Powershell
# To see the PSDrives available for registry run the following command
Get-PSDrive -PSProvider Registry

Set-Location -Path HKCU:
New-Item -Name PWSHLab
```

- Create a registry property in the PWSHLab called CreatedDate, containing todays date

```Powershell
Set-Location -Path .\PWSHLab\
New-ItemProperty -Name CreatedDate -Value (Get-Date) -Path .
```

- Use Get-ChildItem to verify the registry key and property

```Powershell
Set-Location -Path ..
Get-ChildItem
```

---

- Use the core commands to remove the file and registry key created

```Powershell
Remove-Item -Path HKCU:\PWSHLab\
Remove-Item -Path C:\PWSHLab\
# If you are certain you want to remove an enitre folder structure, use the -Recurse flag with Remove-Item
```

---

*More Reading*

```Powershell
Get-Help about_Providers
Get-Help about_*Provider
Get-Help about_Core_Commands
```
