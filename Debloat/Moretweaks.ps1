# Disables Windows Feedback Experience
Write-Output "Disabling Windows Feedback Experience program"
$Advertising = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo'
If (Test-Path $Advertising) {
  Set-ItemProperty $Advertising -Name Enabled -Value 0 -Verbose
} 

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

# Turns off Data Collection via the AllowTelemtry key by changing it to 0
Write-Output "Turning off Data Collection"
$DataCollection = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection'    
If (Test-Path $DataCollection) {
	Set-ItemProperty $DataCollection -Name AllowTelemetry -Value 0 -Verbose
}

#Disables scheduled tasks that are considered unnecessary 
Write-Output "Disabling scheduled tasks"
Get-ScheduledTask -TaskName XblGameSaveTaskLogon | Disable-ScheduledTask
Get-ScheduledTask -TaskName XblGameSaveTask | Disable-ScheduledTask
Get-ScheduledTask -TaskName Consolidator | Disable-ScheduledTask
Get-ScheduledTask -TaskName UsbCeip | Disable-ScheduledTask
Get-ScheduledTask -TaskName DmClient | Disable-ScheduledTask
Get-ScheduledTask -TaskName DmClientOnScenarioDownload | Disable-ScheduledTask



