# get_env.ps1 prints environment variables of looking process
# usage: powershell -ep bypass get_env.ps1 {image_name_without_ext}
# example: powershell -ep bypass get_env.ps1 notepad

param(
    [string]$imageName
)

if (-not $imageName) {
    Write-Host "Please provide the image name as an argument."
    exit
}

$processes = Get-Process | Where-Object { $_.ProcessName -like "*$imageName*" }

if ($processes.Count -eq 0) {
    Write-Host "No processes found."
    exit
}

foreach ($process in $processes) {
    $envVars = [System.Environment]::GetEnvironmentVariables([System.EnvironmentVariableTarget]::Process)

    Write-Host "Process: $($process.ProcessName) (PID: $($process.Id))"
    foreach ($envVar in $envVars.GetEnumerator()) {
        Write-Host "$($envVar.Key)=$($envVar.Value)"
    }
    Write-Host
}