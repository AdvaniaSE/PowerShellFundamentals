## Lab 08. Detailed - PSDrives

- Find available PowerShell Providers on your computer

```Powershell
Get-PSProvider
```

---

- Create an empty folder on your computer with the path "C:\PWSHLab\"

```Powershell
New-Item -Path 'C:\PWSHLab' -ItemType Directory
```

- Create a empty text file called "pwshtestfile.txt" inside the PWSHLab folder

```Powershell
Set-Location -Path 'C:\PWSHLab'
New-Item -Name 'pwshtestfile.txt' -ItemType File
```

- Use PowerShell to edit the contents of the file

```Powershell
Set-Content -Path '.\pwshtestfile.txt' -Value 'Hello world!'
```

- Use PowerShell to verify the CreationTime and LastWriteTime of the file

```Powershell
 Get-ItemProperty -Path '.\pwshtestfile.txt' -Name CreationTime, LastWriteTime
```

- Create a subfolder inside the PWSHLab folder

```Powershell
New-Item -Name 'folder' -ItemType Directory
```

---

- Create a new registry key in the HKEY_CURRENT_USER store called PWSHLab

```Powershell
# To see the PSDrives available for registry run the following command
Get-PSDrive -PSProvider Registry

Set-Location -Path 'HKCU:'
New-Item -Name 'PWSHLab'
```

- Create a registry property in the PWSHLab called CreatedDate, containing todays date

```Powershell
Set-Location -Path '.\PWSHLab'
New-ItemProperty -Name 'CreatedDate' -Value (Get-Date) -Path '.'
```

- Use Get-ChildItem to verify the registry key and property

```Powershell
Set-Location -Path '..'
Get-ChildItem
```

---

- Use PowerShell to remove both the file and the registry key created

```Powershell
Remove-Item -Path 'HKCU:\PWSHLab'
Remove-Item -Path 'C:\PWSHLab'
```

*Tip:* If you are certain you want to remove an entire folder structure you can use the -Recurse flag with `Remove-Item`.

---

*More Reading*

```Powershell
Get-Help about_Providers
Get-Help about_*Provider
Get-Help about_Core_Commands
```
