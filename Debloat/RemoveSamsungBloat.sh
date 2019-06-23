# =======================================================================================================
#
# RemoveSamsungBloat.sh
#
# This script can be used to help alleviate my phone from all of the crap
# that the manufacturer and carrier put on my phone.
# 
# Sample Commands
#
# List all of the packages on the phone. Includes system, user, installed and not.
# adb shell pm list packages | sort 
#
# Disables a given packages.  This can be un-done with the command that follows.
# adb shell pm disable-user --user 0 com.google.package.name
#
# Un-disables a package disabled by command above.
# adb shell pm enable --user 0 com.google.package.name
#
# Deletes and uninstalls a package.  Note, this cannot be un-done short of a reinstall of the OS.
# adb shell pm uninstall -k --user 0 com.google.package.name
#
# Misc Commands
# adb shell pm list packages -s  (Shows only system packages)
# adb shell pm list packages -3  (Shows all non-system packages)
# adb shell pm list packages -d  (Shows all disabled packages)
# adb shell pm list packages -e  (Shows all enabled packages)
#
# Additional Commands
# adb shell pm uninstall -k --user 0 <packagename>    (this command completely uninstalls. Careful, is irreversible! Without a reset.
# adb shell pm enable --user 0 <packagename>   
# adb shell cmd package install-existing com.sec.android.app.launcher (Run this if accidentally delete all launchers)
# =======================================================================================================
#
# Useless apps so un-necessary I completely delete the package from my phone.
pm uninstall -k --user 0 com.hancom.office.editor.hidden
pm uninstall -k --user 0 com.samsung.android.widgetapp.yahooedge.finance
pm uninstall -k --user 0 com.samsung.android.widgetapp.yahooedge.sport

# Remove Bixby
pm disable-user --user 0 com.samsung.android.bixby.agent
pm disable-user --user 0 com.samsung.android.bixby.agent.dummy
pm disable-user --user 0 com.samsung.android.bixby.service
pm disable-user --user 0 com.samsung.android.bixby.wakeup
pm disable-user --user 0 com.samsung.android.bixbyvision.skincare
pm disable-user --user 0 com.samsung.android.app.settings.bixby
pm disable-user --user 0 com.samsung.systemui.bixby2
pm disable-user --user 0 com.samsung.android.app.spage   # (Bixby Home) NOTE!  This one will re-start after every reboot.  

# Bixby Vision - These are used by the camera app to scan bar codes, QR codes, etc, etc.  These could be useful.
pm disable-user --user 0 com.samsung.android.bixbyvision.framework
pm disable-user --user 0 com.samsung.android.visionintelligence

# Remove carrier apps
pm disable-user --user 0 com.customermobile.preload.vzw              # Carrier garbage
pm disable-user --user 0 com.LogiaGroup.LogiaDeck                    # Carrier garbage
pm disable-user --user 0 com.securityandprivacy.android.verizon.vms  # Security and Privacy
pm disable-user --user 0 com.telecomsys.directedsms.android.SCG      # Verizon Location Agent
pm disable-user --user 0 com.vcast.mediamanager                      # My Cloud
pm disable-user --user 0 com.verizon.llkagent                        # LLKAgent
pm disable-user --user 0 com.verizon.mips.services                   # My Verizon Services
pm disable-user --user 0 com.verizon.obdm                            # D-Mat
pm disable-user --user 0 com.vzw.ecid                                # Caller Name Id
pm disable-user --user 0 com.vzw.hss.myverizon                       # My Verizon

# Remove Edge Panels
pm disable-user --user 0 com.samsung.android.app.appsedge 
pm disable-user --user 0 com.samsung.android.app.clipboardedge  
pm disable-user --user 0 com.samsung.android.app.taskedge 
# pm disable-user --user 0 com.samsung.android.app.sbrowseredge  # Don't disable this!  Doing so will disable the Samsung browser.
pm disable-user --user 0 com.sec.android.app.quicktool
pm disable-user --user 0 com.samsung.android.service.peoplestripe

# Remove the edge screen AND lighting! (Be careful with this one.)
pm disable-user --user 0 com.samsung.android.app.cocktailbarservice

# Remove fonts.
pm disable-user --user 0 com.monotype.android.font.chococooky
pm disable-user --user 0 com.monotype.android.font.cooljazz
pm disable-user --user 0 com.monotype.android.font.rosemary

# Remove Air Command Stuff.
pm disable-user --user 0 com.samsung.android.aircommandmanager
pm disable-user --user 0 com.samsung.android.service.aircommand
pm disable-user --user 0 com.samsung.android.service.airviewdictionary

# Remove Game apps.
pm disable-user --user 0 com.samsung.android.game.gamehome           # Game Launcher
pm disable-user --user 0 com.enhance.gameservice                     # Game Optimizing Service
pm disable-user --user 0 com.samsung.android.game.gametools          # Game Tools

# Remove Google Apps that aren't used.
pm disable-user --user 0 com.android.bips                           # Default Print Service (Camera.app)
pm disable-user --user 0 com.android.chrome
pm disable-user --user 0 com.android.printspooler
pm disable-user --user 0 com.android.providers.partnerbookmarks
pm disable-user --user 0 com.google.android.gm                      # GMail
pm disable-user --user 0 com.google.android.printservice.recommendation 
pm disable-user --user 0 com.google.android.youtube

# Remove Google Stuff
pm disable-user --user 0 com.android.bookmarkprovider                # Not sure, something to do with bookmarks
pm disable-user --user 0 com.android.egg                             # Easter eggs
pm disable-user --user 0 com.android.managedprovisioning             # Work profile setup - not for home users
pm disable-user --user 0 com.android.providers.userdictionary        # User Dictionary
pm disable-user --user 0 com.google.android.feedback                 # Google Market Feedback agent
# pm disable-user --user 0 com.google.android.googlequicksearchbox   # Don't disable this!  This is the central Google app, needed!
pm disable-user --user 0 com.google.android.onetimeinitializer       # Google One Time Init - triggered on first boot

# Remove Samsung Camera stuff
pm disable-user --user 0 com.samsung.android.app.camera.sticker.facear.preload
pm disable-user --user 0 com.samsung.android.app.camera.sticker.facear3d.preload
pm disable-user --user 0 com.samsung.android.app.camera.sticker.facearframe.preload
pm disable-user --user 0 com.samsung.android.app.camera.sticker.stamp.preload
pm disable-user --user 0 com.sec.android.app.camera.avatarauth       # My Emoji Maker

# Remove Samsung Clipboard Improvements.  Disabling these does not affect Android Clipboard.
pm disable-user --user 0 com.samsung.android.clipboarduiservice
pm disable-user --user 0 com.samsung.clipboardsaveservice

# Remove Samsung DEX 
pm disable-user --user 0 com.samsung.desktopsystemui
pm disable-user --user 0 com.sec.android.desktopcommunity
pm disable-user --user 0 com.sec.android.desktopmode.uiservice
pm disable-user --user 0 com.sec.android.app.desktoplauncher

# Remove Samsung Interactive Screensaver stuff.
pm disable-user --user 0 com.android.dreams.basic
pm disable-user --user 0 com.samsung.daydream.customization
pm disable-user --user 0 com.android.dreams.phototable

# Remove Samsung LED Cover Stuff (useless without those cases)
pm disable-user --user 0 com.samsung.android.app.ledcoverdream
pm disable-user --user 0 com.sec.android.cover.ledcover

# Remove Samsung Pass and Samsung Pay Stuff.
pm disable-user --user 0 com.samsung.android.samsungpass                  # Samsung Pass
pm disable-user --user 0 com.samsung.android.samsungpassautofill          # Autofill with Samsung Pass - for web only w/ Samsung browser
pm disable-user --user 0 com.samsung.android.spayfw                       # Samsung Pay
pm disable-user --user 0 com.sec.android.app.billing                      # Samsung Billing

# Remove Samsung Stuff.
pm disable-user --user 0 com.diotek.sec.lookup.dictionary                 # Dictionary
pm disable-user --user 0 com.gd.mobicore.pa                               # Not sure
pm disable-user --user 0 com.hiya.star                                    # HIYA Spam stuff
pm disable-user --user 0 com.samsung.android.app.reminder                 # Samsung Reminder
pm disable-user --user 0 com.samsung.android.calendar                     # Samsung Calendar
pm disable-user --user 0 com.samsung.android.da.daagent                   # Dual accounts for same app
pm disable-user --user 0 com.samsung.android.drivelink.stub               # Samsung's version of android auto
pm disable-user --user 0 com.samsung.android.emojiupdater                 # Emoji Updater
pm disable-user --user 0 com.samsung.android.game.gos                     # Game Optimizing Service
pm disable-user --user 0 com.samsung.android.mateagent                    # Samsung Galaxy Friends
pm disable-user --user 0 com.samsung.android.messaging                    # Samsung Messages.app
pm disable-user --user 0 com.samsung.android.rlc                          # Remote Mobile Manager (Customize phone remotely)
pm disable-user --user 0 com.samsung.android.scloud                       # Samsung Cloud
pm disable-user --user 0 com.samsung.android.keyguardwallpaperupdator     # Not sure
pm disable-user --user 0 com.samsung.app.highlightplayer                  # Samsung Gallery - Story Video Editor
pm disable-user --user 0 com.samsung.android.app.assistantmenu            # Assistant Menu - bubble helps you navigate
pm disable-user --user 0 com.samsung.android.app.mirrorlink               # Mirrorlink
pm disable-user --user 0 com.samsung.android.app.notes                    # Samsung Notes
pm disable-user --user 0 com.samsung.android.app.simplesharing            # Link Sharing - Limited to 2gb / day - only to samsung accounts
pm disable-user --user 0 com.samsung.android.app.social                   # What's new
pm disable-user --user 0 com.samsung.android.mdm                          # MDMApp
pm disable-user --user 0 com.samsung.android.provider.stickerprovider     # Sticker crap
pm disable-user --user 0 com.samsung.android.service.livedrawing          # Live Message - Used in messages.app
pm disable-user --user 0 com.samsung.android.stickercenter                # Sticker Crap
pm disable-user --user 0 com.samsung.android.universalswitch              # Universal switch - uses a peripheral for touching
pm disable-user --user 0 com.samsung.storyservice                         # Samsung Gallery - Story Service
pm disable-user --user 0 com.samsung.vvm                                  # Samsung Voicemail
pm disable-user --user 0 com.sec.android.app.clockpackage                 # Samsung Clock
pm disable-user --user 0 com.sec.android.easyonehand                      # Easy One Handed Mode
pm disable-user --user 0 com.sec.android.app.popupcalculator              # Samsung Calculator
pm disable-user --user 0 com.sec.android.app.chromecustomizations         # Samsung Chrome Customizations
pm disable-user --user 0 com.sec.android.mimage.gear360editor             # Gear 360 editor
pm disable-user --user 0 com.sec.android.mimage.photoretouching           # Samsung Photo Editor
pm disable-user --user 0 com.sec.android.widgetapp.easymodecontactswidget # Samsung Contacts Widget
pm disable-user --user 0 com.sec.android.widgetapp.samsungapps            # Samsung apps widget
pm disable-user --user 0 com.sec.enterprise.mdm.services.simpin           # Samsung Enterprise Sim Pin Service
pm disable-user --user 0 com.sec.enterprise.mdm.vpn                       # Samsung Enterprise App
pm disable-user --user 0 com.sec.unifiedwfc                               # WIFI Calling
pm disable-user --user 0 com.skms.android.agent                           # SKMS Agent Server - Has to do with NFC.
pm disable-user --user 0 flipboard.boxer.app                              # Briefing
pm disable-user --user 0 com.sec.android.daemonapp                        # Samsung Weather
pm disable-user --user 0 com.sec.android.inputmethod                      # Samsung Keyboard
pm disable-user --user 0 com.samsung.carrier.logcollector                 # Not sure
pm disable-user --user 0 com.samsung.knox.securefolder                    # Samsung Secure Folder
pm disable-user --user 1 com.samsung.knox.securefolder                    # Samsung Secure Folder 2

# Remove VR Stuff.
pm disable-user --user 0 com.google.ar.core                               # Google VR SDK
pm disable-user --user 0 com.google.vr.vrcore                             # Google VR Service
pm disable-user --user 0 com.samsung.android.hmt.vrsvc                    # Samsung VR
