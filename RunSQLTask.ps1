Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
$SQLServer = "DESKTOP-DOGIRCC\NEETESHSQL2022"
$Database = "msdb"
Invoke-Sqlcmd -ServerInstance $SQLServer -Database $Database -Inputfile 'C:\Users\Neetesh\Desktop\Sql_Re-Try.sql'