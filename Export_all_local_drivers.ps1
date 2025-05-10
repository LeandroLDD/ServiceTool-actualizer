param (
    [Parameter(Mandatory = $true)]
	[string]$destinationPath
)
$destinationPath = $destinationPath.Trim('"')

Export-WindowsDriver -Online -Destination $destinationPath