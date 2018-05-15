
# Remove the bloatware from getting through the firewall.
Get-NetFirewallRule | Where { $_.Group -like '*@{*' } | Remove-NetFirewallRule
Get-NetFirewallRule | Where { $_.Group -eq 'DiagTrack' } | Remove-NetFirewallRule
Get-NetFirewallRule | Where { $_.DisplayGroup -eq 'Delivery Optimization' } | Remove-NetFirewallRule
Get-NetFirewallRule | Where { $_.DisplayGroup -like 'Windows Media Player Network Sharing Service*' } | Remove-NetFirewallRule

# Stops the Windows Feedback Experience from sending anonymous data
Write-Output "Stopping the Windows Feedback Experience program"
$Period1 = 'HKCU:\Software\Microsoft\Siuf'
$Period2 = 'HKCU:\Software\Microsoft\Siuf\Rules'
$Period3 = 'HKCU:\Software\Microsoft\Siuf\Rules\PeriodInNanoSeconds'
If (!(Test-Path $Period3)) { 
	mkdir $Period1 -ErrorAction SilentlyContinue
    mkdir $Period2 -ErrorAction SilentlyContinue
    mkdir $Period3 -ErrorAction SilentlyContinue
    New-ItemProperty $Period3 -Name PeriodInNanoSeconds -Value 0 -Verbose -ErrorAction SilentlyContinue
}

# Prevent bloatware from returning.
Write-Output "Adding Registry key to prevent bloatware apps from returning"
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
If (!(Test-Path $registryPath)) {
	Mkdir $registryPath -ErrorAction SilentlyContinue
    New-ItemProperty $registryPath -Name DisableWindowsConsumerFeatures -Value 1 -Verbose -ErrorAction SilentlyContinue
} 

# Let mixed reality portal be uninstalled.
Write-Output "Setting Mixed Reality Portal value to 0 so that you can uninstall it in Settings"
$Holo = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Holographic'    
If (Test-Path $Holo) {
	Set-ItemProperty $Holo -Name FirstRunSucceeded -Value 0 -Verbose
}


#Disables scheduled tasks that are considered unnecessary 
Write-Output "Disabling scheduled tasks"
Get-ScheduledTask -TaskName XblGameSaveTaskLogon | Disable-ScheduledTask
Get-ScheduledTask -TaskName XblGameSaveTask | Disable-ScheduledTask
Get-ScheduledTask -TaskName Consolidator | Disable-ScheduledTask
Get-ScheduledTask -TaskName UsbCeip | Disable-ScheduledTask
Get-ScheduledTask -TaskName DmClient | Disable-ScheduledTask
Get-ScheduledTask -TaskName DmClientOnScenarioDownload | Disable-ScheduledTask
