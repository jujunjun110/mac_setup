# まずは手動で以下を実行
Set-ExecutionPolicy RemoteSigned

# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco upgrade chocolatey

# System Tools
choco install -y git
choco install -y keyhac
choco install -y anaconda3
choco install -y fluent-terminal

# Utilities
choco install -y googlechrome
choco install -y sublimetext3
choco install -y vscode
choco install -y zoom
choco install -y googlejapaneseinput
choco install -y dropbox
choco install -y slack
choco install -y line

# Heavy Stuffs
choco install -y steam
choco install -y blender
choco install -y unity-hub

