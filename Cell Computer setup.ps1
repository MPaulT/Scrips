$signature = @"
[DllImport("user32.dll")]
public static extern bool BlockInput(bool fBlockIt);
"@
$BlockInput = Add-Type -memberDefinition $signature -name Win32BlockInput -namespace     Win32Functions -passThru

function Enable-BlockInput { $null = $BlockInput::BlockInput($true) }
function Disable-BlockInput{ $null = $BlockInput::BlockInput($false)}
<#Credetials For NAS#>
net use \\nas\data mikniktristo	/user:mike /persistent:yes
Disable-BlockInput
function Show-Menu
{
     param (
           [string]$Title = 'Pinn Computer Setup'
     )
     cls
     Write-Host "================ $Title ================"
     
     Write-Host "Pleas Enter The Cell Number You Need To Setup"
     Write-Host "IE: Pinn1 = 1 or ABB 15 = 15."
     Write-Host "The old Computer need to have the Network Cable Disconnected"
     Write-Host "and power down Befor runng this file ! ! !"
     Write-Host -
}
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
             'B' {
                cls
                'You Chose option #B'
                'This is the Pinn-Backup Computer Setup'
                Set-Variable -Name CellName -Value "Pinn-backup"
                Set-Variable -Name CellNum -Value "-backup"
           } 
             '1' {
                cls
                'You Chose option #1'
                'This is the Pinn1 Computer Setup'
                Set-Variable -Name CellName -Value Pinn1
                Set-Variable -Name CellNum -Value 1
           } 
             '2' {
                cls
                'You Chose option #2'
                'This is the Pinn2 Computer Setup'
                Set-Variable -Name CellName -Value Pinn2
                Set-Variable -Name CellNum -Value 2
           } 
             '3' {
                cls
                'You Chose option #3'
                'This is the Pinn3 Computer Setup'
                Set-Variable -Name CellName -Value Pinn3
                Set-Variable -Name CellNum -Value 3
           } 
             '4' {
                cls
                'You Chose option #4'
                'This is the Pinn4 Computer Setup'
                Set-Variable -Name CellName -Value Pinn4
                Set-Variable -Name CellNum -Value 4
           } 
             '5' {
                cls
                'You Chose option #5'
                'This is the Pinn5 Computer Setup'
                Set-Variable -Name CellName -Value Pinn5
                Set-Variable -Name CellNum -Value 5
           } 
             '6' {
                cls
                'You Chose option #6'
                'This is the Pinn6 Computer Setup'
                Set-Variable -Name CellName -Value Pinn6
                Set-Variable -Name CellNum -Value 6
           } 
             '7' {
                cls
                'You Chose option #7'
                'This is the Pinn7 Computer Setup'
                Set-Variable -Name CellName -Value Pinn7
                Set-Variable -Name CellNum -Value 7
           } 
             '8' {
                cls
                'You Chose option #8'
                'This is the Pinn8 Computer Setup'
                Set-Variable -Name CellName -Value Pinn8
                Set-Variable -Name CellNum -Value 8
           } 
             '9' {
                cls
                'You Chose option #9'
                'This is the Pinn9 Computer Setup'
                Set-Variable -Name CellName -Value Pinn9
                Set-Variable -Name CellNum -Value 9
           } 
             '10' {
                cls
                'You Chose option #10'
                'This is the Pinn10 Computer Setup'
                Set-Variable -Name CellName -Value Pinn10
                Set-Variable -Name CellNum -Value 10
           } 
             '11' {
                cls
                'You Chose option #11'
                'This is the Pinn11 Computer Setup'
                Set-Variable -Name CellName -Value Pinn11
                Set-Variable -Name CellNum -Value 11
           } 
             '12' {
                cls
                'You Chose option #12'
                'This is the ABB12 Computer Setup'
                Set-Variable -Name CellName -Value ABB12
                Set-Variable -Name CellNum -Value 12
           } 
             '13' {
                cls
                'You Chose option #13'
                'This is the ABB13 Computer Setup'
                Set-Variable -Name CellName -Value ABB13
                Set-Variable -Name CellNum -Value 13
           } 
             '14' {
                cls
                'You Chose option #14'
                'This is the ABB14 Computer Setup'
                Set-Variable -Name CellName -Value ABB14
                Set-Variable -Name CellNum -Value 14
           } 
             '15' {
                cls
                'You Chose option #15'
                'This is the ABB15 Computer Setup'
                Set-Variable -Name CellName -Value ABB15
                Set-Variable -Name CellNum -Value 15
           }
             '16' {
                cls
                'You Chose option #16'
                'This is the Pinn16 Computer Setup'
                Set-Variable -Name CellName -Value Pinn16
                Set-Variable -Name CellNum -Value 16
           } 
             'q' {
                return
           }
     }
     pause
}
until ($input)
<#Change the Computer Name#>
Enable-BlockInput
Rename-Computer -NewName $CellName -WhatIf
<#REG to Run At Start Up#>
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\run /v Pinnworks /t REG_SZ /d "C:\invisible.vbs C:\loop.bat $CellNum" /F
<#Load RSlinx Settings#>
Set-Location "C:\Program Files\Rockwell Software\RSlinx"
backupcmd.exe -r -f:"C:\Cell Setup\RSlinx\$CellName.rsx" -i
<#Desktop Shortcut#>
Set-Location "C:\Cell Setup"
xxmklink.exe "C:\Users\User\Desktop\Pinnworks.lnk" "C:\invisible.vbs C:\loop.bat $CellNum" C:\ 3 "C:\Debug\app.publish\Robot.ico"
<#Setup Cell Backup#>
Install.bat
<#NAS Backup File Text#>
$Backupfile = @"
! THis is the Setup file for Auto_Backup program.  
!

Root: Cell_Backup\$CellName
Days: 1
Launch: "C:\Program Files\Nas_Backup\empty.bat"

Email: Nathaniel.Rutherford@Kuntz.com

C:\Cell_backup

"@
<#Host File Location#>
$Backupfile | New-Item "C:\Program Files\Nas_Backup\Configuration"
<#Copy Old Backups from the NAS#>
Set-Variable -Name RobotBackup -Value (Get-ChildItem '\\NAS\Backup\CELL_BACKUP\$CellName' -Name)
Copy-Item -Path '\\NAS\Backup\CELL_BACKUP\$CellName\$RobotBackup'-Recurse -Force
<#Turn Off Windows Firewall#>
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
<#Set the IP Address#>
if ($CellNum -lt 7)
{
    if ($CellName -eq 'Pinn1')
    {
        CLS
        <#Pinn 1 Static IP Addresses#>
        'This is the Pinn1 Static IP Addresses'
        New-NetIPAddress -InterfaceIndex 1 -IPAddress 172.16.2.101 -PrefixLength 12 -DefaultGateway 172.16.0.4
        netsh interface ipv4 add address "Local Area Connection" 192.169.0.169 255.255.255.0
    }
    Elseif ($CellName -eq 'Pinn2')
    {
        CLS
        <#Pinn 2 IP Static Addresses#>
        'This is the Pinn2 Static IP Addresses'
        New-NetIPAddress -InterfaceIndex 1 -IPAddress 172.16.2.102 -PrefixLength 12 -DefaultGateway 172.16.0.4
        netsh interface ipv4 add address "Local Area Connection" 192.169.0.171 255.255.255.0
    }
    Elseif ($CellName -eq 'Pinn3')
    {
        CLS
        <#Pinn 3 IP Static Addresses#>
        'This is the Pinn3 Static IP Addresses'
        New-NetIPAddress -InterfaceIndex 1 -IPAddress 172.16.2.103 -PrefixLength 12 -DefaultGateway 172.16.0.4
        netsh interface ipv4 add address "Local Area Connection" 192.169.0.170 255.255.255.0
    }
    Elseif ($CellName -eq 'Pinn4')
    {
        CLS
        <#Pinn 4 IP Static Addresses#>
        'This is the Pinn4 Static IP Addresses'
        New-NetIPAddress -InterfaceIndex 1 -IPAddress 172.16.2.104 -PrefixLength 12 -DefaultGateway 172.16.0.4
        netsh interface ipv4 add address "Local Area Connection" 192.169.0.18 255.255.255.0
    }
    Elseif ($CellName -eq 'Pinn5')
    {
        CLS
        <#Pinn 5 IP Static Addresses#>
        'This is the Pinn5 Static IP Addresses'
        New-NetIPAddress -InterfaceIndex 1 -IPAddress 172.16.2.105 -PrefixLength 12 -DefaultGateway 172.16.0.4
        netsh interface ipv4 add address "Local Area Connection" 192.169.0.253 255.255.255.0

    }
    Else
    {
        CLS
        <#Pinn 6 IP Static Addresses#>
        'This is the Pinn6 Static IP Addresses'
        New-NetIPAddress -InterfaceIndex 1 -IPAddress 172.16.2.106 -PrefixLength 12 -DefaultGateway 172.16.0.4
        netsh interface ipv4 add address "Local Area Connection" 192.169.0.136 255.255.255.0
    }
    Set-DnsClientServerAddress -InterfaceIndex 1 -ServerAddresses 172.16.0.4
}
Else
{
    CLS
    <#These Cells Do Not Need a Static IP Addresses#>
    'These Cells Are Given IP Address by DHPC'
    Remove-NetIPAddress -InterfaceIndex 1
    Set-DnsClientServerAddress -InterfaceIndex 1 -ServerAddresses 172.16.0.4
}
<#Remove Computer Setup Files#>
Remove-Item -Path 'C:\Cell Setup'
'The Computer Will Now Retart'
Restart-Computer -Delay 30 -Force
<#Remove-Item -Path "C:\Users\User\Desktop\Computer setup"#>