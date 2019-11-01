# Search for files matching a pattern.
# testing to see if quicker than running a findstr on cmd line.

$boxName = $env:COMPUTERNAME
$searchPath = "C:\users"
# below includes specify all the file extensions on drive that will be searched.
$buildSearchStr = Get-ChildItem $searchPath -Recurse -Force -Include *.ps1, *.txt, *.bat, *.ini, *.xml, *.properties -ErrorAction SilentlyContinue
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
