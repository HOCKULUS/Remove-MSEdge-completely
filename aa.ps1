$installer_folder = gci -Path "C:\Program Files (x86)\Microsoft\Edge\Application\" -recurse | Where-Object {$_.Name -like "*setup.exe*"}
start $installer_folder.FullName -ArgumentList "--uninstall --msedge --system-level --verbose-logging --force-uninstall"
$installer_folder = gci -Path "C:\Program Files (x86)\Microsoft\EdgeWebView\Application" -recurse | Where-Object {$_.Name -like "*setup.exe*"}
start $installer_folder.FullName -ArgumentList "--uninstall --msedgewebview --system-level --verbose-logging --force-uninstall"
$edge_folders = gci -Path "C:\Program Files (x86)\Microsoft" | Where-Object {$_.Name -match "edge"}
foreach($folder in $edge_folders){
    Remove-Item $folder.fullname  -recurse -Force 
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft" -Name "DoNotUpdateToEdgeWithChromium" -Value 1
$edge_app_folder = gci -Path "C:\Program Files\WindowsApps" -recurse | Where-Object {$_.Name -like "*MicrosoftEdge*"}
foreach($folder in $edge_app_folder){
    Remove-Item $folder.fullname  -recurse -Force 
}
