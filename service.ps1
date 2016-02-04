[CmdletBinding()]
Param(
	[parameter(Mandatory=$true, HelpMessage="Name of the service")]
	[string]$service
)
$serviceObj = Get-Service $service
Write-Verbose ('Stopping '+$service)
Stop-Service $service -WarningAction SilentlyContinue
$serviceObj.WaitForStatus('Stopped')
Write-Verbose ('Starting '+$service)
Start-Service $service -WarningAction SilentlyContinue
$serviceObj.WaitForStatus('Running')
Write-Verbose ('Done')