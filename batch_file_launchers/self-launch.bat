@powershell "& ([Scriptblock]::Create( ((gc -raw '%~df0') -replace '^@powershell.*' ) )) %*" || pause & goto :eof 
###
### The first line is a batch file, the rest of this file is a PowerShell script. Magic!
###

    function ExitWithAnyKey {
        # If running in the console, wait for input before closing, to make sure the user can see any warnings.
        if ($Host.Name -eq "ConsoleHost")
        {
            Write-Host ""
            Write-Host "Please press any key to continue..."
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
        }
        Exit
    }

Write-Host 'Hello world';

ExitWithAnyKey
