# Find all installed PowerShell modules greater than 500kb in total directory size of the module folder and create a csv report containing each module name, path and size in kb

# First define some variables we are goung to need
[array]$AllInstalledModuleFolders = @()
[array]$Result = @()

# Get a list of all module paths in current profile
$AllModulePaths = $env:PSModulePath -split ';'

# Loop through and get all installed module directories
foreach ($ModulePath in $AllModulePaths) {
    # Because a modulepath can exist as a variable without actually existing on disk, we add erroraction.
    $AllInstalledModuleFolders += Get-ChildItem -Path $ModulePath -Directory -ErrorAction SilentlyContinue
}

# We check which of all filders that is bigger than 500kb
foreach ($ModuleFolder in $AllInstalledModuleFolders) { 
    $TotalSizeOfFolder = (Get-ChildItem $ModuleFolder -Recurse | Measure-Object -Sum -Property Length | Select-Object -ExpandProperty Sum) / 1kb

    # if size is bigger than 500kb, add it to result as a pscustomobject
    if ($TotalSizeOfFolder -ge 500) {
        $Result += [pscustomobject]@{
            'Name' = $ModuleFolder.Name
            'Path' = $ModuleFolder.FullName
            'Size' = "{0:N2}" -f $TotalSizeOfFolder
        }
    }
}

# Finaly, convert the result to a csv file

$Result | Export-Csv -Path C:\Temp\ModuleFolders.csv
