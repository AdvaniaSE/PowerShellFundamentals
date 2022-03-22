# Lab 02. Detailed - PowerShell Help

**In order to be able to update all available help files, for all your modules, you need to start your powershell console as Administrator.**

You can find all commands related to help in PowerShell by running the command

```PowerShell
Get-Command -Name *help
```

---

Update your local help files by running the command

```PowerShell
Update-Help
```

After updating your help files you can find help for any command by running the command

```PowerShell
Get-Help -Name $CommandName
```

`$CommandName` is the name of the command that you wish to view help documentation for. There are several parameters to retrieve more information about the command, such as `-Examples` or `-Detailed`.

---

There is also built-in help for many of concepts in PowerShell in so-called "about-files" which you can find by running

```PowerShell
Get-Help about_*
```

---

- If you are not using Windows, install the module `Microsoft.PowerShell.GraphicalTools`

```PowerShell
# Find the module in PSGallery, wildcards are supported
Find-Module -Name '*GraphicalTools'

# After verifying that you have found the right module, you can install it
Install-Module -Name 'Microsoft.PowerShell.GraphicalTools' | 
```

---

*Tip:* In most cases you can read the latest version of the documentation online. By using the `-Online` switch parameter in the command `Get-Help`, you will automatically open a browser with the documentation.

---

*More Reading*

```PowerShell
Get-Help about_Updatable_Help
Get-Help about_Command_Syntax
```
