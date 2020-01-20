## Lab 10. Detailed - Conditions & Loops

- List all even numbers between 0 and 10 using a foreach and a while loop

```Powershell
# Foreach, Using the % modulus operator
$AllNumbers = 0,1,2,3,4,5,6,7,8,9,10
Foreach ($Number in $AllNumbers) {
    If ($Number % 2 -eq 0) {
        Write-Output $Number
    }
}

# While
$i = 0
while ($i -le 10) {
    If ($i -in 0,2,4,6,8,10) {
        Write-Output $i
    }
    $i++
}
```

---

- Get all years between 2020 and 2050 where New Year's Eve falls on a Thursday

```Powershell
2020..2050 | Foreach-Object -Process {
    $NewYearsEve = Get-Date "$_-12-31"
    If ($NewYearsEve.DayOfWeek -eq 'Thursday') {
        Write-Output $NewYearsEve.Year
    }
}
```

---

- Create a switch of today's week day:
  - Monday: I miss weekends
  - Tuesday-Thursday: Just another $_
  - Friday-Sunday: Weekend wohoo!

- Rewrite the test to loop throug each weekday

```Powershell
switch (0..6 | Foreach-Object -Process { (Get-Date).AddDays($_).DayOfWeek }) {
    'Monday'                   { 'Monday nooo' }
    { $_ -gt 1 -and $_ -lt 5 } { "Just another $_" }
    'Friday'                   { "$_ Weekend wohoo!" }
    { $_ -match '^s.*' }       { "It's weekend!" }
    Default {}
}
```

---

*Get-Help*

```Powershell
Get-Help about_While
Get-Help about_Foreach
Get-Help about_Do
Get-Help about_For
```
