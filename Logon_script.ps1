Clear-Host
Function LogWrite
{
Param ([string]$logstring)
Add-content $Logfile -value $logstring
}
$maand = Get-Date -format MMMM
$Logfile = "C:/Path/$maand-log.log"
$date = get-date -format g
$username = get-content ENV:username
$computername = get-content ENV:computername
$ipaddress = Get-NetIPAddress -IpAddress *.*.*.* | Select-Object -ExpandProperty IPAddress
LogWrite "-----------------------------------------"
LogWrite "Ingelogd:"
LogWrite "Gebruiker: $username"
LogWrite "Computer: $computername"
LogWrite "Datum: $date"
LogWrite "IP-Address: $ipaddress"
