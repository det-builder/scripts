# This is my script to remove the *useless* built-in Windows 10 apps from a new install.
  
# Alarms and clock
Get-AppxPackage -Name "Microsoft.WindowsAlarms" | Remove-AppxPackage
  
# Bing stuff (finance, news, sports & weather)
Get-AppxPackage -Name "Microsoft.BingFinance" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingNews" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingSports" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.BingWeather" | Remove-AppxPackage
  
# Calendar
Get-AppxPackage -Name "microsoft.windowscommunicationsapps" | Remove-AppxPackage
  
# Calculator
# Get-AppxPackage -name "Microsoft.WindowsCalculator" | Remove-AppxPackage
  
# Camera
Get-AppxPackage -Name "Microsoft.WindowsCamera" | Remove-AppxPackage
  
# DisneyMagicKingdoms
Get-AppxPackage -Name "MA278AB0D.DisneyMagicKingdoms" | Remove-AppxPackage
Get-AppxPackage -Name "A278AB0D.DisneyMagicKingdoms" | Remove-AppxPackage
  
# Dolby
Get-AppxPackage -Name "DolbyLaboratories.DolbyAccess" | Remove-AppxPackage

# Facebook
Get-AppxPackage *Facebook* | Remove-AppxPackage

# Feedback Hub
Get-AppxPackage -Name "Microsoft.WindowsFeedbackHub" | Remove-AppxPackage
  
# Get Help
Get-AppxPackage -Name "Microsoft.GetHelp" | Remove-AppxPackage
  
# Get Office
Get-AppxPackage -Name "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage
  
# Get Skype
# Get-AppxPackage -Name "Microsoft.SkypeApp" | Remove-AppxPackage
  
# Groove Music
Get-AppxPackage -Name "Microsoft.ZuneMusic" | Remove-AppxPackage
  
# Hidden City Game
Get-AppxPackage -Name "828B5831.HiddenCityMysteryofShadows" | Remove-AppxPackage
  
# Maps
Get-AppxPackage -Name "Microsoft.WindowsMaps" | Remove-AppxPackage

# March of Empires
Get-AppxPackage -Name "A278AB0D.MarchofEmpires" | Remove-AppxPackage
  
# Messaging
Get-appxpackage -Name "Microsoft.Messaging" | remove-appxpackage

# Microsoft crap
Get-AppxPackage -Name "Microsoft.MicrosoftPowerBIForWindows" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.NetworkSpeedTest" | Remove-AppxPackage

# Minecraft
Get-AppxPackage -Name "Microsoft.MinecraftUWP" | Remove-AppxPackage
  
# Movies & TV
# Get-AppxPackage *zunevideo* | Remove-AppxPackage

# Onenote
Get-AppxPackage -Name "Microsoft.Office.OneNote" | Remove-AppxPackage
  
# Paid Wifi & Cellular
Get-AppxPackage -Name "Microsoft.OneConnect" | Remove-AppxPackage
  
# People
Get-AppxPackage -Name "Microsoft.People" | Remove-AppxPackage
  
# Phone & Phone Companion
get-appxpackage *phone* | remove-appxpackage
  
# Paint 3D
# Get-AppxPackage -Name "Microsoft.MSPaint" | Remove-AppxPackage
  
# Photos
Get-AppxPackage *photos* | Remove-AppxPackage
  
# Reader
Get-AppxPackage *reader* | remove-appxpackage
  
# Scan
Get-AppxPackage *WindowsScan* | Remove-AppxPackage
  
# Solitaire
Get-AppxPackage -Name "Microsoft.MicrosoftSolitaireCollection" | Remove-AppxPackage
  
# Sticky Notes
Get-AppxPackage -Name "Microsoft.MicrosoftStickyNotes" | Remove-AppxPackage
  
# Sway
Get-AppxPackage *Office.Sway* | Remove-AppxPackage
  
# Tips
Get-AppxPackage -Name "Microsoft.Getstarted" | Remove-AppxPackage
  
# Useless games & crap
Get-AppxPackage -Name "king.com.CandyCrushSaga" | Remove-AppxPackage
Get-AppxPackage -Name "king.com.CandyCrushSodaSaga" | Remove-AppxPackage
Get-AppxPackage -Name "king.com.*" | Remove-AppxPackage
  
# Voice Recorder
Get-AppxPackage -Name "Microsoft.WindowsSoundRecorder" | Remove-AppxPackage
  
# View 3D
Get-AppxPackage -Name "Microsoft.Microsoft3DViewer" | Remove-AppxPackage
  
# XBox
Get-AppxPackage -Name "Microsoft.Xbox.TCUI" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxApp" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxGameOverlay" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxGamingOverlay" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxIdentityProvider" | Remove-AppxPackage
Get-AppxPackage -Name "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage
  
# To reinstall ALL Windows default apps, run this command:
Get-AppXPackage | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
  
# To get a listing of installed packages, run this command:
Get-AppxPackage | select name, packagefullname | d:\packages.txt

# To get a listing of the default apps windows installs for a new user:
Get-ProvisionedAppXPackage -Online|Select DisplayName
