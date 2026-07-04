# Build the site and publish public/ to the gh-pages branch.
# Requires: hugo on PATH (or edit $hugo below), git remote "origin" set.
$ErrorActionPreference = "Stop"

$hugo = "hugo"
if (-not (Get-Command hugo -ErrorAction SilentlyContinue)) {
  $hugo = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe\hugo.exe"
}

$root = $PSScriptRoot
$remote = git -C $root remote get-url origin

Remove-Item "$root\public" -Recurse -Force -ErrorAction SilentlyContinue
& $hugo --source $root --minify
if ($LASTEXITCODE -ne 0) { throw "hugo build failed" }

Set-Location "$root\public"
git init -b gh-pages | Out-Null
git add -A
git commit -m "Deploy site $(Get-Date -Format 'yyyy-MM-dd HH:mm')" | Out-Null
git push -f $remote gh-pages
Set-Location $root
Write-Host "Deployed to gh-pages -> https://spaul571.github.io/"
