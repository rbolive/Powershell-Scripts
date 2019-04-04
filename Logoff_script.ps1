﻿Clear-Host
Function LogWrite
{
Param ([string]$logstring)
Add-content $Logfile -value $logstring
}
$maand = Get-Date -format MMMM
$Logfile = "C:/Prank/$maand-log.log"
$date = get-date -format g
$username = get-content ENV:username
$computername = get-content ENV:computername
$ipaddress = Get-NetIPAddress -IpAddress 145.*.*.* | Select-Object -ExpandProperty IPAddress
LogWrite "-----------------------------------------" LogWrite "Uitgelogd:"
LogWrite "Gebruiker: $username"
LogWrite "Computer: $computername"
LogWrite "Datum: $date"
LogWrite "IP-Address: $ipaddress"