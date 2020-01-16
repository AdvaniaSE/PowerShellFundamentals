## Lab 10. Detailed - Conditions & Loops

- List all even numbers between 0 and 10 using a foreach and a while loop
- Get all years between 2020 and 2050 where New Year's Eve falls on a Thursday
- Create a switch of today's week day:
Monday: I miss weekends
Tuesday-Thursday: Just another $_
Friday-Sunday: Weekend wohoo! Test for each weekday

```switch (0..6 | % { (Get-Date).AddDays($_).DayOfWeek }) {
    'Monday' { 'Monday nooo' }
    { $_ -gt 1 -and $_ -lt 5 } { "Just another $_" }
    'Friday' { "Just another $_" }
    { $_ -match '^s.*' } { "It's weekend!" }
    Default {}
}```