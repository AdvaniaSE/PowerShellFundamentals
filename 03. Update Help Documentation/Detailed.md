## Lab 03. Detailed - Update Help Documentation

**In order to be able to update all available help files, for all your modules, you need to start your powershell console as Administrator.**

You can find all commands related to help in PowerShell by running the command

```Powershell
Get-Command -Name *help
```

---

Update your local help files by running the command

```Powershell
Update-Help
```

After updating your help files you can find help on all cmdlets by running the command

```Powershell
Get-Help -Name $CommandName
```

`$CommandName` is the name of the command that you wish to view help documentation for.

---

There is also built-in help for many of concepts in PowerShell in so-called 'about files' which you can find by running

```PowerShell
Get-Help about_*
```

In most cases you can read the latest version of the documentation online. By using the `-Online` switch parameter in the `Get-Help` cmdlet you will automaticaly open a browser with the URL to documentation.

---

*More Reading*

```Powershell
Get-Help about_Updatable_Help
Get-Help about_Command_Syntax
```
