

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



#$connection_string = "DSN=PB/pbread;Uid=my_username;Pwd=my_password"
$connection_string = "DSN=PB/pbread"

$conn = New-Object System.Data.Odbc.OdbcConnection($connection_string)
$conn.open()
if ($conn.State -eq [Data.ConnectionState]::Closed) {
    ExitWithAnyKey
}

# an SQL query that should always succeed, even if the user has zero permissions
# see also -- https://stackoverflow.com/a/3670000/1042525
$cmd = $conn.CreateCommand()
$cmd.CommandText = "SELECT 1 FROM SYSIBM.SYSDUMMY1"

$reader = $cmd.ExecuteReader()
Write-Output "======== query results ========"
while ($reader.Read()) {
    Write-Output $reader[0]
}
$reader.Close()
$conn.Close()

ExitWithAnyKey
