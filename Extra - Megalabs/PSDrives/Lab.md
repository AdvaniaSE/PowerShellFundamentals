# Lab 07. PSDrives


- Find available PowerShell Providers on your computer

---

- Create an empty folder on your computer called with the path "C:\PWSHLab\"
- Create a empty text file called "pwshtestfile.txt" inside the PWSHLab folder
- Use PowerShell to edit the contents of the file
- Use PowerShell to verify the `CreationTime` and `LastWriteTime` of the file
- Create a subfolder inside the folder "PWSHLab"

---

- Create a new registry key called "PWSHLab" in the "HKEY_CURRENT_USER" store
- Create a registry property called `CreatedDate` in the "PWSHLab" key, containing today's date
- Use `Get-ChildItem` to verify the registry key and property

---

- Use PowerShell to remove both the file and the registry key created
