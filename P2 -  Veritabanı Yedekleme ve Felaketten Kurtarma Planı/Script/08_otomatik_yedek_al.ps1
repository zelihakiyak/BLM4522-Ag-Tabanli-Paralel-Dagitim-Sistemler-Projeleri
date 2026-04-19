$ServerInstance = ".\SQLEXPRESS"
$Database = "AdventureWorks2022"
$BackupPath = "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup"
$Date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$BackupFile = "$BackupPath\AW_Otomatik_$Date.bak"
$LogFile = "C:\Backup\yedek_log.txt"

try {
    $Query = "BACKUP DATABASE [$Database]
    TO DISK = '$BackupFile'
    WITH FORMAT, INIT, 
    NAME = 'Otomatik Yedek $Date', 
    STATS = 10"

    Invoke-Sqlcmd -ServerInstance $ServerInstance -Query $Query
    
    $Mesaj = "$(Get-Date) - BASARILI: $BackupFile olusturuldu"
    Add-Content -Path $LogFile -Value $Mesaj
    Write-Host $Mesaj
}
catch {
    $Mesaj = "$(Get-Date) - HATA: $_"
    Add-Content -Path $LogFile -Value $Mesaj
    Write-Host $Mesaj
}

# Task Scheduler kurulumu
$Action = New-ScheduledTaskAction `
    -Execute "PowerShell.exe" `
    -Argument "-ExecutionPolicy Bypass -File `"C:\Backup\yedek_al.ps1`""

$Trigger = New-ScheduledTaskTrigger `
    -Daily `
    -At "02:00AM"

$Settings = New-ScheduledTaskSettingsSet `
    -ExecutionTimeLimit (New-TimeSpan -Hours 1) `
    -RestartCount 3 `
    -RestartInterval (New-TimeSpan -Minutes 10)

Register-ScheduledTask `
    -TaskName "AdventureWorks Otomatik Yedek" `
    -Action $Action `
    -Trigger $Trigger `
    -Settings $Settings `
    -RunLevel Highest `
    -Force

# Doğrulama
Get-ScheduledTask -TaskName "AdventureWorks Otomatik Yedek"
