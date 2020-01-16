switch (0..6 | % { (Get-Date).AddDays($_).DayOfWeek }) {
    'Monday' { 'Monday nooo' }
    { $_ -gt 1 -and $_ -lt 5 } { "Just another $_" }
    'Friday' { "Just another $_" }
    { $_ -match '^s.*' } { "It's weekend!" }
    Default {}
}

