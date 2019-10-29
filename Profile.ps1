function ssh1 {ssh root@223.223.233.2}
function ssh2 {ssh root@223.223.233.3}
function VMRUN1 {Get-VM | Where-Object {$_.State -match "Running"}}
function VMNOTRUN1 {Get-VM | Where-Object {$_.State -ne "running" }}
function FEDORAON {start-vm "Fedora Server"}
function UBUNTON {start-vm "Ubutu Server"}
function FEDORAON {Stop-vm "Fedora Server"}
function UBUNTON {Stop-vm "Ubutu Server"}
Function VMIP1 {Get-VM | Where-Object {$_.State -match "Running"}| Get-VMNetworkAdapter}


Set-Alias -Name ubunt -Value ssh1
Set-Alias -Name fedora -Value ssh2
Set-Alias -Name f5 -Value Clear-Host
Set-Alias -Name vmrun -Value VMRUN1
Set-Alias -Name vmoff -Value VMNOTRUN1
Set-Alias -Name fon -Value FEDORAON
Set-Alias -Name uon -Value UBUNTON
Set-Alias -Name foff -Value FEDORAON
Set-Alias -Name uoff -Value UBUNTON
Set-Alias -Name vmip -Value VMIP1
