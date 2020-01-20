## Lab 03. Detailed - Update Help Documentation

**In order to be able to update all available help files, for all your modules, you need to start your powershell console as Admin.**

You can find all commands related to help in PowerShell by running the command

```Powershell
Get-Command -Name *help
```

---

Update your local help files by running the command

```Powershell
update-help
```

---

After updating your help files you can find help on all CmdLets by running the command

```Powershell
Get-Help -Name $CommandName
```

Where $CommandName is the name of your command.

---

There is also built in help for many of PowerShells concepts built in 'about files' which you can find by running

```PowerShell
Get-Help about_*
```

---

In most cases you can read the latest version of the documentation online. By using the -online switch in the Get-Help CmdLet, you will automaticaly open a browser with the URL to documentation.

---

*Get-Help*

```Powershell

```
