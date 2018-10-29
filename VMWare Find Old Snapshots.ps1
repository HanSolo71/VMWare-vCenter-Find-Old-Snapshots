Import-Module VMware.VimAutomation.Cis.Core
Import-Module VMware.VimAutomation.Common
Import-Module VMware.VimAutomation.Core
#Age in days of snapshots to list
( $Age = 2 )

Connect-VIServer vcenter.corp.com
$vm = Get-VM
$snapshots = Get-Snapshot -VM $vm
Write-Host -ForegroundColor Red "Old snapshots found:"
foreach ( $snap in $snapshots ) {
    if ( $snap.Created -lt (Get-Date).AddDays( -$Age ) ) {
            Write-Host "Name: " $snap.VM "  Size: " $snap.SizeGB "  Created: " $snap.Created
    }
}