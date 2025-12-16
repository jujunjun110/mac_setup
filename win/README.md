# Windows Setup

## セットアップ

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

## インストールされるもの

- VS Code
- Sublime Text
- Chrome
- Slack
- PowerToys (CapsLock → Right Ctrl)
- Keyhac (キーボードカスタマイズ)
- Google日本語入力

## パッケージ追加

```powershell
winget search <パッケージ名>
```
