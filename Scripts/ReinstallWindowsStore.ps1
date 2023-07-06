Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

#It reinstalls the Windows Store, but doesn’t install anything else, letting you pick and choose what apps you actually want.