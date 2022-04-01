<# 
- Create a csv report with the following information information from your computer:
  - Manufacturer
  - OS Version
  - Serial Number
  - BIOS Version
  - Total RAM
  - Number of Disk Partitions
  - TPM Status (Enabled/Disabled)
#>

$ComputerInfo = Get-ComputerInfo
New-Object -TypeName psobject -Property @{
    'Manufacturer' = $ComputerInfo.CsManufacturer
    'OsVersion' = $ComputerInfo.OsVersion
    'SerialNumber' = $ComputerInfo.BiosSerialNumber
    'BiosVersion' = $ComputerInfo.BiosCaption
    'TotalRam' = $ComputerInfo.CsPhysicallyInstalledMemory / 1mb
    'NuberOfPartitions' = Get-Disk | Select-Object -ExpandProperty NumberOfPartitions
    'TPMStatus' = Get-Tpm | Select-Object -ExpandProperty TpmReady
} | ConvertTo-Csv

