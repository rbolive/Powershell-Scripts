if ((get-process -name mspaint -ea SilentlyContinue) -eq $Null){
    echo "Paint is not running"
}
else{
    get-process -name mspaint | export-csv C:\logboek.csv 
    Stop-Process -name mspaint
}

if ((get-process -name wordpad -ea SilentlyContinue) -eq $Null){
    echo "Wordpad is not running"
}
else{
    get-process -name wordpad | export-csv C:\logboek.csv 
    Stop-Process -name wordpad
}