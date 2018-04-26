	This is my script to remove the *useless* built-in Windows 10 apps from a new install.
  
  # Alarms and clock
  Get-AppxPackage *windowsalarms* | Remove-AppxPackage
  
  # Bing stuff (finance, news, sports & weather)
  Get-AppxPackage -Name "Microsoft.BingFinance" | Remove-AppxPackage
  Get-AppxPackage -Name "Microsoft.BingNews" | Remove-AppxPackage
  Get-AppxPackage -Name "Microsoft.BingSports" | Remove-AppxPackage
  Get-AppxPackage -Name "Microsoft.BingWeather" | Remove-AppxPackage
  
  # Calendar
  Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
  
  # Calculator
  Get-AppxPackage *calculator* | Remove-AppxPackage
  
  # Camera
  Get-AppxPackage *windowscamera* | Remove-AppxPackage
  
  # Feedback Hub
  Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage
  
  # Get Help
  Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage
  
  # Get Office
  Get-AppxPackage *officehub* | Remove-AppxPackage
  
  # Get Skype
  Get-AppxPackage *skypeapp* | Remove-AppxPackage
  
  # Groove Music
  Get-AppxPackage *zunemusic* | Remove-AppxPackage
  
  # Maps
  Get-AppxPackage *windowsmaps* | Remove-AppxPackage

  # Microsoft stuff
  Get-AppxPackage -Name "Microsoft.MicrosoftPowerBIForWindows" | Remove-AppxPackage
  Get-AppxPackage -Name "Microsoft.NetworkSpeedTest" | Remove-AppxPackage
  
  # Minecraft
  Get-AppxPackage -Name "Microsoft.MinecraftUWP" | Remove-AppxPackage
  
  # Money
  Get-AppxPackage *bingfinance* | Remove-AppxPackage
  
  # Movies & TV
  Get-AppxPackage *zunevideo* | Remove-AppxPackage
  
  # Messaging
  Get-appxpackage *messaging* | remove-appxpackage
  
  # Microsoft WIFI
  Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage
  
  # Onenote
  Get-AppxPackage *onenote* | Remove-AppxPackage
  
  # Paid Wifi & Cellular
  Get-AppxPackage *OneConnect* | Remove-AppxPackage
  
  # People
  Get-AppxPackage *people* | Remove-AppxPackage
  
  # Phone & Phone Companion
  get-appxpackage *phone* | remove-appxpackage
  
  # Paint 3D
  Get-AppxPackage *MSPaint* | Remove-AppxPackage
  
  # Photos
  Get-AppxPackage *photos* | Remove-AppxPackage
  
  # Reader
  Get-AppxPackage *reader* | remove-appxpackage
  
  # Scan
  Get-AppxPackage *WindowsScan* | Remove-AppxPackage
  
  # Solitaire
  Get-AppxPackage *solitairecollection* | Remove-AppxPackage
  
  # Sticky Notes
  Get-AppxPackage *Stickynotes* | Remove-AppxPackage
  
  # Sway
  Get-AppxPackage *Office.Sway* | Remove-AppxPackage
  
  # Tips
  Get-AppxPackage *Getstarted* | Remove-AppxPackage
  
  # Useless games & crap
  Get-AppxPackage -Name "king.com.CandyCrushSaga" | Remove-AppxPackage
  Get-AppxPackage -Name "king.com.CandyCrushSodaSaga" | Remove-AppxPackage
  Get-AppxPackage -Name "king.com.*" | Remove-AppxPackage
  
  # Voice Recorder
  Get-AppxPackage *soundrecorder* | Remove-AppxPackage
  
  # View 3D
  Get-AppxPackage *Microsoft3DViewer* | Remove-AppxPackage
  
  # XBox
  Get-AppxPackage *xboxapp* | Remove-AppxPackage
  
  # To reinstall ALL Windows default apps, run this command:
  Get-AppXPackage | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
  
  
