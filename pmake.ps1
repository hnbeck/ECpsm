################################################################################
# Script to compile mercury app
#
# Author: Hans N. Beck
################################################################################
[CmdletBinding()]
param(
    [Parameter()]
    [String]$App
)

$scriptpath = Split-Path ($MyInvocation.MyCommand.Path) 
$AppDir = (Get-Item $scriptpath).FullName
$Path = $AppDir + "\src"

write-output "Application compile at $AppDir, sources at $Path"

Push-Location $Path
mercury -r -E $App
Start-Sleep 1

# this is because something (the cp) in the make don't work on Windows 11
try {
    Move-Item -Path ./*.exe -Destination ../bin/
    Get-Item ./*.* | ForEach-Object {
            if ((Get-ChildItem $_).Extension -ne ".m") 
                {  
                    Move-Item $_ -Destination ../tmp}}
} catch {
    write-output "Error during clean-up - check files!"
}

Pop-Location

