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

# 実行
.\win\install.ps1
```

## インストールされるもの

- VS Code
- Sublime Text
- Chrome
- Slack
- Google日本語入力

## パッケージ追加

```powershell
winget search <パッケージ名>
```
