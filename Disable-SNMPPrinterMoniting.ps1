# Turn off SNMP monitoring for printer status
# Requires admin elevation
# Charles Opppermann, chuckop@malwarebytes.com, 2020-11-24

[CmdletBinding()]
Param()

Write-Host "Turn off SNMP monitoring for printer status"

# First set the registry key
# This affects all printer connections on this machine
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Print"
$RegKey = "SNMPLegacy"

# Set this to 1 to disable, 0 to reenable.
$RegValue = "1"

Write-Verbose "Create registry key with value"
New-ItemProperty -Path $RegPath -Name $RegKey -Value $RegValue -PropertyType DWORD -Force

# Restart the spooler service
Write-Verbose "Restart the printer spooler service"
Restart-Service "Spooler" -Force

Write-Host "Finished"

