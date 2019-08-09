<#Credetials For NAS#>
net use \\nas\data mikniktristo	/user:mike /persistent:yes
<#These are the Computer and webpage that are added to the Host file#>
$hostfile = @"
172.16.0.4    DATATRACKING
172.16.0.4    DATATRACKING.COM
172.16.0.4    WWW.DATATRACKING.COM
172.16.0.4    WWW.DATATRACKING
172.16.10.30  HD1
172.16.10.40  HS1
172.16.10.33  HA1
"@
<#Host File Location#>
$hostfile | Add-Content C:\Windows\System32\drivers\etc\hosts

<#User Auto Logon#>
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /T REG_SZ /D User /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /T REG_SZ /D paymenow /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /T REG_SZ /D 1 /f

<#Programs to Copy From NAS#>
Copy-Item -Path \\NAS\

<#Programs to Run At Start Up#>

<#Change power plan#>
POWERCFG -DUPLICATESCHEME 381b4222-f694-41f0-9685-ff5bb260df2e ffffffff-ffff-ffff-ffff-ffffffffffff
POWERCFG -SETACTIVE ffffffff-ffff-ffff-ffff-ffffffffffff
POWERCFG -CHANGENAME ffffffff-ffff-ffff-ffff-ffffffffffff Power_Master Power_Master
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 4f971e89-eebd-4455-a8de-9e59040e7347 a7066653-8d6c-40a8-910e-a1f54b84c7e5 2
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 25
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 3600
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 100
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 50
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1
POWERCFG -SETDCVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 4f971e89-eebd-4455-a8de-9e59040e7347 a7066653-8d6c-40a8-910e-a1f54b84c7e5 2
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 25
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 3600
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 100
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 50
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1
POWERCFG -SETACVALUEINDEX ffffffff-ffff-ffff-ffff-ffffffffffff 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0

POWERCFG -DELETE 33657d50-1ff4-4945-baec-04cfa65f01d7
POWERCFG -DELETE 381b4222-f694-41f0-9685-ff5bb260df2e
POWERCFG -DELETE 42bdc3ef-ad56-4140-b85b-f8bcf74a1c32
POWERCFG -DELETE 54b5d3e0-f85b-4851-a89b-7f6b3fd2c152
POWERCFG -DELETE 785890ea-18a9-4edf-bd43-6233b1d22692
POWERCFG -DELETE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
POWERCFG -DELETE 9442fb85-be59-44e6-917f-e0187f8d5f74
POWERCFG -DELETE a1841308-3541-4fab-bc81-f71556f20b4a
POWERCFG -DELETE fdf23bd5-6a94-4a2e-9247-e914bd1467d9


reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{025A5937-A6BE-4686-A844-36FE4BEC8B6D} /v PREFERREDPLAN /T REG_SZ /D ffffffff-ffff-ffff-ffff-ffffffffffff /f
POWERCFG -SETACTIVE ffffffff-ffff-ffff-ffff-ffffffffffff