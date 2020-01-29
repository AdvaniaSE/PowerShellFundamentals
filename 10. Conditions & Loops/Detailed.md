## Lab 10. Detailed - Conditions & Loops

- List all even numbers between 0 and 10

- Using a `foreach` loop

```Powershell
# foreach - Using the % modulus operator
$AllNumbers = 0,1,2,3,4,5,6,7,8,9,10
foreach ($Number in $AllNumbers) {
    if ($Number % 2 -eq 0) {
        Write-Output $Number
    }
}
```

- Using a `while` loop

```Powershell
# while - With a manually defined list
$i = 0
while ($i -le 10) {
    if ($i -in 0,2,4,6,8,10) {
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
    if ($NewYearsEve.DayOfWeek -eq 'Thursday') {
        Write-Output $NewYearsEve.Year
    }
}
```

---

- Create a `switch` of today's weekday and output text depending on the day
  - Monday: I miss weekends
  - Tuesday-Thursday: Just another `$_`
  - Friday-Sunday: Weekend wohoo!

```Powershell
$Today = Get-Date | Select-Object -ExpandProperty DayOfWeek
switch ($Today) {
    'Monday' { 'I miss weekends' }
    'Tuesday' { "Just another $_" }
    'Wednesday' { "Just another $_" }
    'Thursday' { "Just another $_" }
    'Friday' { 'Weekend wohoo!' }
    'Saturday' { 'Weekend wohoo!' }
    'Sunday' { 'Weekend wohoo!' }
}
```

- Rewrite the test to loop through each weekday

```Powershell
# This example includes different ways of comparing strings in a switch statement
$OneWeek = 0..6 | Foreach-Object -Process { (Get-Date).AddDays($_).DayOfWeek }

# If the switch input is an array, it will automaticaly loop through each object in the array.

switch ($OneWeek) {
    'Monday' { 'I miss weekends' } # String comparison
    { $_ -gt 1 -and $_ -lt 5 } { "Just another $_" } # DayOfWeek can also be counted using numbers
    'Friday' { "$_ Weekend wohoo!" }
    { $_ -match '^s.*' } { "It's weekend!" } # Regex comparison
}
```

---

*More Reading*

```Powershell
Get-Help about_While
Get-Help about_Foreach
Get-Help about_Do
Get-Help about_For
Get-Help about_Switch
```
