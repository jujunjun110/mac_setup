# まずは手動で以下を実行
Set-ExecutionPolicy RemoteSigned

# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco upgrade chocolatey

choco install -y googlechrome
choco install -y sublimetext3
choco install -y dropbox
choco install -y git
choco install -y keyhac
choco install -y vscode
choco install -y fluent-terminal
choco install -y googlejapaneseinput
choco install -y steam
choco install -y blender
choco install -y unity-hub
choco install -y zoom

