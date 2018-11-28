
#Parameter URL to download 
[CmdletBinding()]
 param (
  [Parameter(Mandatory = $true, Position = 0)]
  $URL = ""
)

$url = $URL
$output = "$PSScriptRoot\DowloadwithPowershell.zip"
$start_time = Get-Date

$wc = New-Object System.Net.WebClient
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc.DownloadFile($url, $output)


Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"