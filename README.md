# SimpleRawrExtractor
There are several parts to this package.
1) The addon itself is all of the lua files and the toc file.
	These need to be placed in the Interface > Addons folder in a folder called "SimpleRawrExtractor".

2) The rawr directory which contains the rawr.exe and supporting files.
	This rawr.exe has had the source code updated so that it pulls the correct stats for WotLK items.
	It should also allow you to pull in characters that are undergeared as well.

3) The simc directory which contains the simc.exe and RunMe.bat. simc.exe has had it's source code updated to pull WotLK items correctly.

4) RunMe.bat is a very simple batch file that runs simc.exe with 5000 iterations and chooses a file named "MyCharacter.XML" from the parent folder.
	You can easily edit this file to change the number of iterations as well as point it to a different xml file.
	It also pauses when it is done so you can read the results.

5) XMLFormatter.ps1 takes the output from the WoW Saved Variables older for the addon and formats it in such a way that it is readable by rawr.
	Just run the powershell file, point it to \WTF\Account\{YOUR_ACCOUNT_NAME}\SavedVariables\SimpleRawrExtractor.lua, and then it will spit out a MyCharacter.XML file in the same folder that you ran the powershell script from. 
	That file can be imported to either rawr and/or simc.


How do I do the things?
Export the addon to the wow addons folder.
Once in game type "/getrawr".
The screen will reload so that the saved variables can be generated.
Now, run the powershell script "XMLFormatter.ps1". *See Note2 at Bottom.*
You can now run rawr and load the "MyCharacter.xml" file OR
you can run simc via the RunMe.bat file.

You can also get information from a target!
Type "/sstart" into WoW and then click on a player.
Then type "/gettarget" into WoW and you will capture their information to the Saved Variables folder.
If you decide to stop after typing "/sstart" simply type "/sstop" to turn off the event listener.


Note: Ensure you either have the MyCharacter.xml file in the root directory (default) or edit the bat file so that it is pointing to the correct location to find the xml file.

Note2: The PowerShell file may not run due to system security settings.
Running the PowerShell command "set-executionpolicy bypass" before you run the program should allow it to run.
After you run it you can run "Set-ExecutionPolicy restricted CurrentUser" to turn security settings back on.
If you're running on Win7 you have to manually put in the directories.

Note3: You cannot get glyph information from your target (AFAIK). There may be other reduced functionality that you can get from yourself but not your target as more features are added.

