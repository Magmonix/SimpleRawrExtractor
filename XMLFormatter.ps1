## This whole script is just to take the output of the WoW addon and strip the extra crap off.
## After it is formatted it will save it to your desktop.
## Load the formatted file into rawr and ggwp.

## Below is where you should be pointing the script to.
## ..\WTF\Account\{ACCOUNT_NAME}\SavedVariables\SimpleRawrExtractor.lua

Function Get-FileName($initialDirectory)#Credit to https://devblogs.microsoft.com/scripting/hey-scripting-guy-can-i-open-a-file-dialog-box-with-windows-powershell/
{  
 [System.Reflection.Assembly]::LoadWithPartialName(“System.windows.forms”) |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = “All files (*.*)| *.*”
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} #This just lets you choose the file location.

$filepath = Get-FileName -initialDirectory “.\”
$file = Get-Content $filepath
$file = $file -replace ',',"`n" 
$file = $file -replace '\\','' 
foreach($line in $file)
{
    if($line.Length -gt 500) ##Magic number for the main contents
    {
        $file = $line
        break
    }
}

$file = $file.Substring(0,$file.Length -2)
$file.Substring(19) | Set-Content .\MyCharacter.xml -Force
