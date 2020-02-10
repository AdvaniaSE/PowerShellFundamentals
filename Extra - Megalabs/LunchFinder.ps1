[psobject]@(
    @{
        Name = 'Bromma kök'
        Address = 'Karlsbodavägen 17E'
        URI = 'http://iettkok.se'
    },
    @{
        Name = 'Pra Thai'
        Address = 'Gårdsfogdevägen 3A'
        URI = ''
    },
    @{
        Name = 'Rockin Burgers'
        Address = 'Bromma Blocks'
        URI = 'http://rockinburgers.se'
    },
    @{
        Name = 'Erssons'
        Address = 'Bromma Blocks'
        URI = 'http://erssons.se'
    },
    @{
        Name = 'Inferno Grill'
        Address = 'Bromma Blocks'
        URI = 'http://infernogrill.nu'
    },
    @{
        Name = 'ChopChop Asian Express'
        Address = 'Bromma Blocks'
        URI = 'http://chopchop.se'
    },
    @{
        Name = 'Brommavik Hotel'
        Address = 'Karlsbodavägen 45'
        URI = 'http://www.brommavik.se/restaurang-och-bar/lunch-2/'
    }
) | Get-Random