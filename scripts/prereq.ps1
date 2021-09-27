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

# setup venv
sudo python3 -m venv env --without-pip
. ./env/bin/activate

# curl main.py script
curl -LO m1ten.github.io/dotfiles/scripts/main.py

# Execute main.py with args?
echo "Would you like to execute main.py?"
echo "If yes, leave blank or pass in args."
echo "If no, enter 'n'."
read -p "option: " option

if [ "$option" != "n" ]; then
	./main.py ${option}
fi

# Remove old files and exit
deactivate
rm -rf env main.py
exit

# -- Bash --

echo > /dev/null <<"out-null" ###
'@ | out-null

# -- PowerShell -- 

$installed = (Get-WMIObject -Query "SELECT * FROM Win32_Product Where Name Like '%python%'").Length -gt 0

if ( -Not $installed ) {
	$py_version = "3.9.7"
	$py_url = "https://www.python.org/ftp/python/$py_version/python-$py_version-amd64.exe"
	$py_outpath = "$PSScriptRoot\python-$py_version.exe"

	Invoke-WebRequest -Uri $py_url -OutFile $py_outpath
	Start-Process -Filepath $py_outpath -Wait
	Remove-Item $py_outpath
}

# setup venv
python -m venv env --without-pip
.\env\Scripts\Activate.ps1

$url = "https://m1ten.github.io/dotfiles/scripts/main.py"
$outpath = "$PSScriptRoot\main.py"

Invoke-WebRequest -Uri $url -OutFile $outpath

Write-Output "Would you like to execute main.py?"
Write-Output "If yes, leave blank or pass in args."
Write-Output "If no, enter 'n'."
$option = Read-Host -Prompt "option"

if (( "n" -ne $option )) {
	python ./main.py $option -Wait
}

deactivate
Remove-Item $outpath
Remove-Item .\env

# -- PowerShell --

out-null