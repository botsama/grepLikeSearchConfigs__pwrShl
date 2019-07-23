# grepLikeSearchConfigs__pwrShl

Grep Like String search all files and their contents for a path or entire drive.

Warning: With C:\* paths you will get a permission error.  This tends to be a Windows 10 based security permission for root boot drive accessing.  Using a Subfolder or any other partition should mediate.

2019-06-10 update to normalize file path as a variable, as similar to other scripts.

The active operational command is Select-String.
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-6

2019-07-15:
To be honest, as this script scales up, you might as well fire up a Linux server and actually process your dataset with Grep.
This works well processing a file system for configuration scripts but let us say you want to... process a very large spreadsheet for matching values?  I suggest switching to running grep, for real.
