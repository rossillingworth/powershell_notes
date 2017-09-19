
<#
.SYNOPSIS
Setup a new website
.DESCRIPTION
Creates everything your new website needs for much win
.PARAMETER siteName
The name for the new website
.EXAMPLE
New-Website -Name FancySite -Po 5000
New-Website SiteWithDefaultPort
New-Website siteName 2000 # ERROR! Port argument could not be validated
('name1','name2') | New-Website -Verbose
#>
function New-Website() {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true, Mandatory=$true)]
        [Alias('name')]
        [string]$siteName,
        [ValidateSet(3000,5000,8000)]
        [int]$port = 3000
    )
    BEGIN { Write-Verbose 'Creating new website(s)' }
    PROCESS { echo "name: $siteName, port: $port" }
    END { Write-Verbose 'Website(s) created' }
}



function FileSize5
  (
  [string] $dir="C:\Windows",
  [int] $minSize=1000000
  )
{
  dir $dir | where {$_.Length -gt $minSize};
}
