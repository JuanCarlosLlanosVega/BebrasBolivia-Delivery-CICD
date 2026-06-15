$ErrorActionPreference = "Stop"

$fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$repo = $env:GITHUB_REPOSITORY
$sha = $env:GITHUB_SHA
$rama = $env:GITHUB_REF_NAME

Write-Host "Iniciando despliegue local..."
Write-Host "Repositorio: $repo"
Write-Host "Rama: $rama"
Write-Host "Commit: $sha"
Write-Host "Fecha: $fecha"

$deployDir = "C:\Bebras-Delivery-Deploy"

if (!(Test-Path $deployDir)) {
  New-Item -ItemType Directory -Path $deployDir | Out-Null
}

@"
Despliegue local ejecutado correctamente.

Fecha: $fecha
Repositorio: $repo
Rama: $rama
Commit: $sha

Resultado:
CI aprobado y CD ejecutado en el runner local de Windows.
"@ | Out-File -FilePath "$deployDir\deploy-local-log.txt" -Encoding utf8

Copy-Item -Path "cliente\src\app\page.tsx" -Destination "$deployDir\page-desplegada.tsx" -Force

Write-Host "Archivo de evidencia generado en:"
Write-Host "$deployDir\deploy-local-log.txt"

Get-Content "$deployDir\deploy-local-log.txt"