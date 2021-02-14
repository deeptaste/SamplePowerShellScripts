<#
* Created by : Diptesh Shrestha
* Email : diptesh.shrestha@gmail.com
#>

# A sample directory path
[string] $SourceDirectory = "C:\Users\Default\Documents\Sample\Project_1\Several_SubFolders_Making_Long_Path\like\abc\xyz\blah1\blah2"

If (Test-Path -path "$SourceDirectory") { 
	
    # Create mapped drive using the source directory path provided above.
    # This will create M drive named as temp with last folder (which in this case is blah2) as the root folder
	subst M: "$SourceDirectory"
	new-psdrive temp filesystem -root M:\
	cd temp:
	
    # Suppose you want to remove subfolders or files under blah3 (which is under blah2) but was causing issue due to long path of it's subfolders
	Remove-Item -path "temp:\blah3" -recurse
	
	# Remove the mapped drive after the task is completed
	cd $SourceDirectory
	remove-psdrive temp 
	subst M: /d
}