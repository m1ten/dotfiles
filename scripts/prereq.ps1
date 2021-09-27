# Supports both Unix and Windows Systems.
# '.ps1' extension is required to run PowerShell on Windows.
# 'chmod +x prereq.ps1 && ./prereq.ps1' on Unix.
# 'PowerShell .\prereq.ps1' on Windows.

echo @'
' > /dev/null

# -- Bash --
 
if ! command -v python3; then
	if [ -x "$(command -v apt)" ]; then
    	sudo apt install python3
  	elif [ -x "$(command -v dnf)" ]; then
    	sudo dnf install python3.9
  	elif [ -x "$(command -v pacman)" ]; then
    	sudo pacman -S python
  	elif [ "$(uname)" = "Darwin" ]; then
		xcode-select --install
	fi
fi

sudo python3 -m venv env --without-pip
. ./env/bin/activate
curl -LO 


# -- Bash --

echo > /dev/null <<"out-null" ###
'@ | out-null

# -- PowerShell -- 
 
$version = "3.9.7"
$url = "https://www.python.org/ftp/python/$version/python-$version-amd64.exe"
$outpath = "$PSScriptRoot/python-$version.exe"
Invoke-WebRequest -Uri $url -OutFile $outpath
Start-Process -Filepath $outpath -Wait
Remove-Item $outpath
 
# -- PowerShell --

out-null