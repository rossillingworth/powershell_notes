Get-Verb
Get-Command
Get-Command -Verb Add

Get-Module

help about*
help -Category All
help about_Automatic_Variables

help about* | grep.exe -i if

Get-Service | Out-File -FilePath ~\services.txt


// save object as CSV
Get-Service | Export-Csv -Path ~\services.csv
Import-Csv c:\service.csv

// compare machine states
// save machine state
Get-Process | Export-Clixml -Path ~\processes.xml
// compare current machnie state 
Compare-Object -ReferenceObject (Import-Clixml ~\processes.xml) -DifferenceObject (Get-Process) -Property name


Get-Service | ConvertTo-Html -Property name,status | Out-File ~\services.html
Get-Service | ConvertTo-Json | Out-File ~\services.json
Get-Service | ConvertTo-SecureString -Property name,status | Out-File ~\services.secure.txt


// show what it would do
Get-Service | Stop-Service -WhatIf

// manual check
Get-Service | Stop-Service -Confirm


// JSON
Get-Date | Select-Object -Property * | ConvertTo-Json | ConvertFrom-Json
Invoke-WebRequest -Uri http://search.twitter.com/search.json?q=PowerShell | ConvertFrom-Json
(Get-Content JsonFile.JSON) -join "`n" | ConvertFrom-Json



