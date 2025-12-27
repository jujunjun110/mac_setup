# Windows Setup

## セットアップ

### 1. Windows側 (PowerShell)

```powershell
# winget確認
winget --version

# Git入れる
winget install --id Git.Git -e --source winget

# クローン
git clone https://github.com/jujunjun110/mac_setup.git
cd mac_setup

# 実行ポリシー設定（初回のみ）
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# パッケージインストール
.\win\install.ps1

# 設定ファイル配置
.\win\setup_config.ps1
```

### 2. WSL側 (bash/zsh)

```bash
cd /path/to/mac_setup/win

# 1. システムパッケージ (apt)
./wsl_packages.sh

# 2. Homebrew インストール
./install_homebrew.sh

# 3. 開発ツール (brew bundle)
./brew_packages.sh
```

## インストールされるもの

### Windows (winget)
- VS Code
- Sublime Text
- Chrome
- Slack
- Microsoft 365
- Keyhac
- Google日本語入力
- GitHub CLI (gh)
- Logi Options+

### WSL

| マネージャー | パッケージ |
|-------------|-----------|
| apt | zsh, docker |
| brew | gh, uv |

## パッケージ管理方針

- **apt**: システム基盤（zsh, docker, ssh等）
- **brew**: 開発ツール（gh, uv, node等）

## パッケージ追加

### Windows
```powershell
winget search <パッケージ名>
```

### WSL (Homebrew)
[Brewfile](./Brewfile) を編集して `./brew_packages.sh` を再実行
