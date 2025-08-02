#Recursively search for alternate data streams from
#Current directory or supplied path 

function Write-Files {param([System.IO.FileSystemInfo[]] $current_files) foreach ($f in $current_files) {$n = $f.FullName ; $streams = Get-Item $n -Stream * ; foreach ($s in $streams.Stream) { if ($s -notmatch ":$DATA") { echo "$n -> $s"}}}} ; function Find-Files { param([string] $path) $current_files = ls -File $path ; $current_dirs = ls -Attributes Directory $path ; Write-Files -current_files $current_files ;   foreach ($d in $current_dirs) {Find-Files -path $d.FullName}} if ($args.Length -eq 0) { Find-Files -path .\} else { Find-Files -path $args[0]}


