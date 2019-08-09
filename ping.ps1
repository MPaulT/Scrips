Write-Host "Now Pinging IPV4 Address"
Write-Host "Please Be Patient"
$ping = New-Object System.Net.NetworkInformation.Ping
$i = 0
250..255 | foreach{$ip = "10.3.207.$_"
    $Res = $ping.Send($ip)
    if ($Res.Status -eq "Success")
    {
        $Result = $ip + " = Success"
        Write-Host $Result
        $i++
    }
}
$hosts = [string]$i + "Hosts is Pingable"
Write-Host "$Hosts"