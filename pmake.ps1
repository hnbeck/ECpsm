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
try {
    mercury -r -E  $App
} 
catch {
   Write-Output "Error during compilation"
   exit
}

Start-Sleep 1

# this is because something (the cp) in the make don't work on Windows 11
try {
    Move-Item -Path ./*.exe -Destination ../bin/ -Force 
    Get-Item ./*.* | ForEach-Object {
            if ((Get-ChildItem $_).Extension -ne ".m") 
                {   Write-Output "Move File: $_"
                    Move-Item $_ -Destination ../tmp -Force }}
} catch {
    write-output "Error during clean-up - check files!"
}

Pop-Location

