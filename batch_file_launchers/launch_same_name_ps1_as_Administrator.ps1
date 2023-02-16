    function ExitWithAnyKey {
        # If running in the console, wait for input before closing, to make sure the user can see any warnings.
        if ($Host.Name -eq "ConsoleHost")
        {
            Write-Host ""
            Write-Host "Press any key to continue..."
            $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
        }
        Exit
    }


Write-Output "$($MyInvocation.MyCommand) was successfully run."

ExitWithAnyKey
