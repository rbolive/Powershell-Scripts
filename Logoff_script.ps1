Clear-Host
Function LogWrite
{
Param ([string]$logstring)
Add-content $Logfile -value $logstring
}
$maand = Get-Date -format MMMM
$Logfile = "C:/Path/Here"
$date = get-date -format g
$username = get-content ENV:username
$computername = get-content ENV:computername
$ipaddress = Get-NetIPAddress -IpAddress *.*.*.* | Select-Object -ExpandProperty IPAddress
LogWrite "-----------------------------------------" LogWrite "Uitgelogd:"
LogWrite "User: $username"
LogWrite "Computer: $computername"
LogWrite "Date: $date"
LogWrite "IP-Address: $ipaddress"
