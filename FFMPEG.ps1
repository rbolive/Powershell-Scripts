Clear-Host

Function LogWrite
{
Param ([string]$logstring)
Add-content $Logfile -value $logstring
}


$maand = Get-Date -format dd-MM-yyyy
$Logfile = "C:\Logfiles\$maand.txt"
$folder = "C:\Users\Administrator\Videos\Import"
$destination = "C:\Users\Administrator\Videos\Export"
$destinationname = "C:\Users\Administrator\Videos\Export\$name.mp4"


$Watcher = New-Object IO.FileSystemWatcher $folder -Property @{ 
    IncludeSubdirectories = $false
    NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'
}

$onCreated = Register-ObjectEvent $Watcher Created -SourceIdentifier FileCreated -Action {
   $path = $Event.SourceEventArgs.FullPath
   $name = $Event.SourceEventArgs.Name
   $changeType = $Event.SourceEventArgs.ChangeType
   $timeStamp = $Event.TimeGenerated
   Logwrite $path
   Logwrite "Het bestand '$name' is geupload op $timeStamp"
   Write-Host $path
   ffmpeg -i $path $destinationname
   Move-Item $path -Destination $destination -Force -Verbose
   Logwrite "Het bestand $destinationname is geconvert op $timeStamp"
   Logwrite ----------------------------------------------------------------------------------
}