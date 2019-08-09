$ping = New-Object System.Net.NetworkInformation.Ping
function infoGet ($varMin, $varMax)
{
Do
    {
        Write-Host "Number with the frist diget grater then 3 have to have a 0 in front"
        $InfoGetmin = Read-Host "Please Enter the $InfoGetNum Octet"
    }
    until ($InfoGetmin)
    if ($InfoGetmin -gt 255)
    {
        do
        {
            Write-Host "Number with the frist diget grater then 3 have to have a 0 in front"
            Write-Host "$InfoGetmin is not a Valid IP Octect" 
            $InfoGetmin = Read-Host "Please Reenter the $InfoGetNum Octet"
        }
        until ($InfoGetmin -lt 256)
    }
    Set-Variable -Name varMin -Value ($InfoGetMin) -Scope Global
    $range = Read-Host "Will There Be a Range Y or N"
    while("y","n" -notcontains $range )
    {
         $range = Read-Host "Will There Be a Range Y or N"
    }
    If ($range -eq "Y")
    {
        do
        {
            $InfoGetmax = Read-Host "Please Enter the End Of Range For the $InfoGetNum Octet"
        }
        Until ($InfoGetmax)
        if ($InfoGetMax -gt 255)
        {
            do
            {
                Write-Host "Number with the frist diget grater then 3 have to have a 0 in front"
                Write-Host "$InfoGetMax is not a Valid IP Octect" 
                $InfoGetMax = Read-Host "Please Reenter the $InfoGetNum Octet"
            }
            until ($InfoGetMax -lt 256)
        }
    }
    Else
    {
        $InfoGetmax = $InfoGetmin
    }
Set-Variable -Name varMax -Value ($InfoGetMax) -Scope Global
}
function Show-Menu
{
     param (
           [string]$Title = 'Computer and PIv4 Finder'
     )
     cls
     Write-Host "================ $Title ================"
     
     Write-Host "This Scrip is used to find all the used IP Address on a Network"
     Write-Host "and match the with a Computer name"
     Write-Host -
}
do
{
    do
    {
        do
        {
            do
            {
                $InfoGetNum = "Frist"
                Show-Menu
                InfoGet
                $1OctetMin = ($varMin)
                $1OctetMax = ($varMax) 
            }
            Until ($1OctetMin, $1OctetMax)
            $InfoGetNum = "Second"
            InfoGet
            $2OctetMin = ($varMin)
            $2OctetMax = ($varMax)
        }        
        Until ($2OctetMin, $2OctetMax)
        $InfoGetNum = "Third"
        InfoGet
        $3OctetMin = ($varMin)
        $3OctetMax = ($varMax)  
    }
    Until ($3OctetMin, $3OctetMax)
    $InfoGetNum = "Fourth"
    InfoGet
    $4OctetMin = ($varMin)
    $4OctetMax = ($varMax) 
}
Until ($4OctetMin, $4OctetMax)
CLS
Write-Host "$1Octetmin.$2Octetmin.$3Octetmin.$4Octetmin - $1OctetMax.$2OctetMax.$3OctetMax.$4OctetMax"
$1Octet = ($1Octetmin)
$2Octet = ($2Octetmin)
$3Octet = ($3Octetmin)
$4Octet = ($4Octetmin)
Write-Host "Now Pinging IPV4 Address"
Write-Host "Please Be Patient"
$f = 0
$1OctetMin..$1OctetMax | ForEach{$f = $_
    $g = 0
    $2OctetMin..$2OctetMax | ForEach{$g = $_
        $h = 0
        $3OctetMin..$3OctetMax | ForEach{$h = $_
            $i = 0
            $4OctetMin..$4OctetMax | foreach{$ip = "$f.$g.$h.$_"
                $Res = $ping.Send($ip)
                if ($Res.Status -eq "Success")
                {
                    $Result = $ip + " = Success"
                    Write-Host $Result
                    $i++
                }
            
            }
        $h++
        }
    $g++
    }
$f++
}
$hosts = [string]$i + "Hosts is Pingable"
Write-Host "$Hosts"
