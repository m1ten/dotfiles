$version = "3.9.7"
$url = "https://www.python.org/ftp/python/$version/python-$version-amd64.exe"
$outpath = "$PSScriptRoot/python-$version.exe"
Invoke-WebRequest -Uri $url -OutFile $outpath
Start-Process -Filepath $outpath -Wait
Remove-Item $outpath