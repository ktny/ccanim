# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

CCAnim (Console Character Animation) は、ターミナル上でAI処理中に動くキャラクターアニメーションを表示するGoプロジェクトです。Bubble Teaフレームワークを使用してTUIアプリケーションを構築します。

## 開発コマンド

プロジェクトは現在初期段階にあるため、以下のコマンドが必要になります：

### Go プロジェクト初期化（Issue #1に基づく）
```bash
# Go modules初期化
go mod init github.com/ktny/ccanim

# 必要な依存関係追加
go get github.com/charmbracelet/bubbletea
go get github.com/charmbracelet/lipgloss
go get github.com/charmbracelet/bubbles

# 依存関係の整理
go mod tidy
```

### ビルドとテスト（Makefile完成後）
```bash
# ビルド
make build

# 実行
make run

# クリーンアップ
make clean

# 開発時の直接実行
go run .
```

## アーキテクチャ

### ディレクトリ構造（計画）
```
ccanim/
├── cmd/              # CLIコマンド定義
│   └── root.go
├── internal/         # プライベートパッケージ
│   ├── character/    # キャラクター表示・アニメーション
│   ├── monitor/      # プロセス監視機能
│   ├── ui/          # Bubble Tea UIコンポーネント
│   └── config/      # 設定管理
├── assets/          # 静的リソース
│   ├── characters/  # ASCII artキャラクター定義
│   └── themes/      # カラーテーマ
├── main.go          # エントリーポイント
└── Makefile         # ビルドツール
```

### 主要コンポーネント

1. **UIアプリケーション** (`internal/ui/app.go`)
   - Bubble TeaのModel-Update-Viewパターンで実装
   - Model構造体がアプリケーション全体の状態を管理
   - キー入力処理（q/Ctrl+C/ESCで終了）

2. **キャラクターシステム** (`internal/character/`)
   - Character構造体: 名前、フレーム、位置、状態を管理
   - ASCII artの複数フレームアニメーション
   - Lip Glossによるスタイリング

3. **プロセス監視** (`internal/monitor/`)
   - 外部プロセスの監視機能（将来実装）
   - 標準出力の監視
   - 状態に応じたアニメーション変更

## 実装の優先順位

現在のIssueに基づく実装順序：

1. **Issue #1**: Go プロジェクト初期化
   - ディレクトリ構造作成
   - go.mod初期化
   - Makefile作成
   - .gitignore作成

2. **Issue #2**: 最小限のBubble Teaアプリケーション
   - main.goとinternal/ui/app.go実装
   - 基本的なModel-Update-View実装
   - デバッグログ設定

3. **Issue #3**: 基本的なキャラクター表示
   - Character構造体実装
   - ASCII art猫キャラクター（最低3フレーム）
   - ターミナル中央配置ロジック

## 技術的な注意点

- Bubble Teaのイベントループを理解して実装すること
- ターミナルサイズ変更イベントへの対応を考慮
- Lip Glossのスタイル定義は再利用可能にする
- ASCII artキャラクターは可読性を重視したフォーマットで管理