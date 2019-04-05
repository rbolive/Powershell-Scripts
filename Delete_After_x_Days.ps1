$folder = "C:\Path\Here"
$days = 10

Get-ChildItem -Path $folder -Recurse -File | `
    Where CreationTime -lt (Get-Date).AddDays(-$days) | ` 
    Remove-Item
Get-ChildItem -Path $folder -Directory -Recurse | `
    Where {(Get-ChildItem $_.FullName).count -eq 0} | ` Select-Object -ExpandProperty Fullname |` 
    Remove-Item
