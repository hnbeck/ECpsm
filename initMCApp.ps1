################################################################################
# Script to cleanup
#
# Author: Hans N. Beck
################################################################################
[CmdletBinding()]
param(
    [Parameter()]
    [Switch]$compile
)

function Start-Cleanup()
{
    write-output "clean-up"
    try {
        Remove-Item $Script:Config\tmp\*.* -ErrorAction SilentlyContinue
        Remove-Item $Script:Config\Mercury\*.* -ErrorAction SilentlyContinue
        Remove-Item $Script:Config\bin\*.exe -ErrorAction SilentlyContinue
    }
    catch 
    {
        write-output "Error during clean-up - check files!"
    }
    write-output "clean-up done"
}
$scriptpath = Split-Path ($MyInvocation.MyCommand.Path) 
$AppDir = (Get-Item $scriptpath).FullName

$Config = $AppDir

write-output "Application start up directory is  $AppDir"

Start-Cleanup
#if ($compile)
#{./
#    Start-Compile
#}

