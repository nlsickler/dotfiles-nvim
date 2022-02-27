$rootFolder = "~/AppData/Local/nvim"
$luaFolder = $rootFolder + "/lua"
$initFile = $rootFolder + "/init.lua"

if ((Test-Path -path $initFile)) {Remove-Item $initFile}
if ((Test-Path -path $luaFolder)) {Remove-Item $luaFolder -Recurse}

Copy-Item $PSScriptRoot/init.lua $rootFolder

New-Item $luaFolder -Type Directory
Copy-Item $PSScriptRoot/lua/* $luaFolder -Recurse
