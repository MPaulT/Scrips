Add-Type @'
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace PInvoke.Win32 {

    public static class UserInput {

        [DllImport("user32.dll", SetLastError=false)]
        private static extern bool GetLastInputInfo(ref LASTINPUTINFO plii);

        [StructLayout(LayoutKind.Sequential)]
        private struct LASTINPUTINFO {
            public uint cbSize;
            public int dwTime;
        }

        public static DateTime LastInput {
            get {
                DateTime bootTime = DateTime.UtcNow.AddMilliseconds(-Environment.TickCount);
                DateTime lastInput = bootTime.AddMilliseconds(LastInputTicks);
                return lastInput;
            }
        }

        public static TimeSpan IdleTime {
            get {
                return DateTime.UtcNow.Subtract(LastInput);
            }
        }

        public static int LastInputTicks {
            get {
                LASTINPUTINFO lii = new LASTINPUTINFO();
                lii.cbSize = (uint)Marshal.SizeOf(typeof(LASTINPUTINFO));
                GetLastInputInfo(ref lii);
                return lii.dwTime;
            }
        }
    }
}
'@

$Processes = @{}
Get-Process -IncludeUserName | ForEach-Object {
    $Processes[$_.Id] = $_
}

function Network-Active
{
    Get-NetTCPConnection | 
        Where-Object { $_.State -eq "Established" } |
        Select-Object RemoteAddress,
            RemotePort,
            @{Name="PID";         Expression={ $_.OwningProcess }},
            @{Name="ProcessName"; Expression={ $Processes[[int]$_.OwningProcess].ProcessName }}, 
            @{Name="UserName";    Expression={ $Processes[[int]$_.OwningProcess].UserName }} |
    Sort-Object -Property ProcessName, UserName <#| Format-Table -AutoSize#>
}

<#{
if (Network-Active | Select-String -Pattern outlook)
    Start-Process notepad
}
else
    {
    Start-Process mspaint
    }
#>

for ( $i = 0; $i -lt 100; $i++ ) {
    Write-Host ("Last input " + [PInvoke.Win32.UserInput]::LastInput)
    Write-Host ("Idle for " + [PInvoke.Win32.UserInput]::IdleTime)
    if ([PInvoke.Win32.UserInput]::IdleTime -gt "00:01:00")
    {
        if (Network-Active | Select-String -Pattern outlook)
        {
            Start-Process notepad
        }
        else
        {
            Start-Process mspaint
        }
    }
    Start-Sleep -Seconds 5
}
