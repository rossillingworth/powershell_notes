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


// 
// SQL like queries
// 

// limit return list
Get-Process | Where-Object {$_.Name –eq “iexplore”}


// remote web console
https://docs.microsoft.com/en-us/powershell/scripting/core-powershell/web-access/use-the-web-based-windows-powershell-console?view=powershell-5.1


// ###################################
// powershell video 4
// ###################################

// limit output properties
get-service | Select -Property name, @{name='stat';expression={$_.Status}}

// convert object to string output for input to another function
Get-WmiObject -class win32_bios -ComputerName (get-adcomputer -filter * | select -ExpandProperty name)

// same as above, shorthand
Get-WmiObject -class win32_bios -ComputerName (get-adcomputer -filter * ).name


// ####################################
// sed in powershell
// ####################################

//
// for-each ... line in a text doc
//
cat test.prop.txt | foreach { $_ -replace "Mary","Susan" }
cat test.prop.txt | % { $_ -replace "Mary","Susan" }

// regex replace
"192.168.15.12,192.168.22.8" -replace "\.\d{2}\.","10"

// regex replace with param extraction
"Don Jones" -replace "([a-z]+)\s([a-z]+)",'$2, $1'


//
// replace contents of a file after replacing text
//
Clear-Host
$file = gci "D:\ProofRead\*.doc"
$file
ForEach ($str in $file) 
{
    $cont = Get-Content -path $str
    $cont
    $cont | ForEach {$_ -replace "the" , "the"} | Set-Content $str
}




