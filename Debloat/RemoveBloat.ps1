# Uninstall useless packages.
Get-AppxPackage -Name "Microsoft.WindowsAlarms" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingFinance" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.BingFoodAndDrink" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingHealthAndFitness" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingNews" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingSports" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingTravel" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingWeather" | Remove-AppxPackage
Get-AppxPackage -Name "microsoft.windowscommunicationsapps" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.WindowsCalculator" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.WindowsCamera" | Remove-AppxPackage
Get-AppxPackage -Name "MA278AB0D.DisneyMagicKingdoms" | Remove-AppxPackage
Get-AppxPackage -Name "A278AB0D.DisneyMagicKingdoms" | Remove-AppxPackage
Get-AppxPackage -Name "DolbyLaboratories.DolbyAccess" | Remove-AppxPackage
Get-AppxPackage *Facebook* | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.WindowsFeedbackHub" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.GetHelp" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.SkypeApp" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.ZuneMusic" | Remove-AppxPackage
Get-AppxPackage -Name "828B5831.HiddenCityMysteryofShadows" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.WindowsMaps" | Remove-AppxPackage
Get-AppxPackage -Name "A278AB0D.MarchofEmpires" | Remove-AppxPackage
Get-appxpackage -Name "Microsoft.Messaging" | remove-appxpackage
Get-AppxPackage -Name "Microsoft.MicrosoftPowerBIForWindows" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.NetworkSpeedTest" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.MinecraftUWP" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.OneConnect" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.CommsPhone" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.WindowsPhone" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.MSPaint" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.Windows.Photos" | Remove-AppxPackage # Photos
Get-AppxPackage -Name "Microsoft.WindowsScan" | Remove-AppxPackage # Windows scan
Get-AppxPackage -Name "Microsoft.MicrosoftSolitaireCollection" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.MicrosoftStickyNotes" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.Office.Sway" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.Getstarted" | Remove-AppxPackage
Get-AppxPackage -Name "king.com.CandyCrushSaga" | Remove-AppxPackage
Get-AppxPackage -Name "king.com.CandyCrushSodaSaga" | Remove-AppxPackage
Get-AppxPackage -Name "king.com.*" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.WindowsSoundRecorder" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.Microsoft3DViewer" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.3DBuilder" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.Xbox.TCUI" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxApp" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxGameOverlay" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxGamingOverlay" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxIdentityProvider" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.MixedReality.Portal" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.ScreenSketch" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.YourPhone" | Remove-AppxPackage
  
# Attempt to get rid of Cortana.
$searchRegistyPath = Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
if($searchRegistyPath -eq $FALSE)
{
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Windows Search"
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana"
    Set-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana" -Value 0
}
else
{
    $allowCortanaRegistryPath = Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana"
    if($allowCortanaRegistryPath -eq $FALSE)
    {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana"
    }
    Set-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana" -Value 0
}
$cortanaPkg = Get-AppxPackage -AllUsers | Where{$_.PackageFullName -ilike '*Cort*'}
foreach($cPkg in $cortanaPkg)
{
    Remove-AppxPackage $cPkg.PackageFullName -Confirm:$FALSE
}


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



# To reinstall ALL Windows default apps, run this command:
# Get-AppXPackage | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
  
# To get a listing of installed packages, run this command:
# Get-AppxPackage | select name, packagefullname | sort name > c:\packages.txt

# To get a listing of the default apps windows installs for a new user:
#Get-ProvisionedAppXPackage -Online|Select DisplayName
