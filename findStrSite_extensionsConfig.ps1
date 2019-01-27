# Search for files matching a pattern.
# testing to see if quicker than running a findstr on cmd line.

$boxName = $env:COMPUTERNAME
# below includes specify all the file extensions on drive that will be searched.
$buildSearchStr = Get-ChildItem c:\* -Recurse -Force -Include *.ps1, *.txt, *.bat, *.ini, *.xml, *.properties -ErrorAction SilentlyContinue
# Edit below for search strings.  Comment out if you are searching for less strings to match.
$wherePattern01 = "grepString01"
$wherePattern02 = "grepYouwant-02"
$wherePattern03 = "servernamePlzu"
$wherePattern04 = "Microsoft"

# Get-Unique added to remove duplicate file name paths with pattern matches.

$bGetQual01 = $buildSearchStr | Select-String "$wherePattern01"
$bGetQual01 | Select Path | Get-Unique -AsString | Export-Csv -Path .\LocalSearches_"$wherePattern01"_RemoveDupes_PathToFiles.csv

$bGetQual02 = $buildSearchStr | Select-String "$wherePattern02"
$bGetQual02 | Select Path | Get-Unique -AsString | Export-Csv -Path .\LocalSearches_"$wherePattern02"_RemoveDupes_PathToFiles.csv

$bGetQual03 = $buildSearchStr | Select-String "$wherePattern03"
$bGetQual03 | Select Path | Get-Unique -AsString | Export-Csv -Path .\LocalSearches_"$wherePattern03"_RemoveDupes_PathToFiles.csv

$bGetQual04 = $buildSearchStr | Select-String "$wherePattern04"
$bGetQual04 | Select Path | Get-Unique -AsString | Export-Csv -Path .\LocalSearches_"$wherePattern04"_RemoveDupes_PathToFiles.csv

# Example: Outputs to a CSV.
#$bGetQual03 = $buildSearchStr | Select-String "$wherePattern03"
#$bGetQual03 | Select Path | Get-Unique -AsString | Export-Csv -Path .\LocalSearches_"$wherePattern03"_RemoveDupes_PathToFiles.csv

# Get-ChildItem has picky syntax so I opted to define the full line with -Includes instead of inserting the extensions.
# -Error Action SilentlyContinue lets the script proceed without dropping errors for protected OS folders that are not relevant to searches.
# 2nd part of Pipe command processes all files matching the extensions defined in the Get-ChildItem includes.
# 3rd Pipe says to only output the full file path. Details for filtering based off the MatchInfo Class
# Link https://docs.microsoft.com/en-us/dotnet/api/microsoft.powershell.commands.matchinfo?view=pscore-6.0.0
# Default params output the line said string is found on, but the output is quite sloppy to parse.
# 4th Pipe purpose is to output the full file path without cutting off characters.
# 5th and final pipe of command outputs files found matching said string into the local folder as .log files, this script is running from.
 