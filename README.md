# CCAnim (Console Character Animation)

ターミナル上でAI処理中に動くキャラクターアニメーションツール

## 概要

CCAnimは、ターミナル上でAIやその他の長時間実行されるプロセスが動作している間に、癒やし系のキャラクターが動き回り、時々コメントを表示するプログラムです。開発者の待ち時間を楽しく、そして癒やしのある時間に変えることを目的としています。

## 特徴

- 🐱 **キャラクターアニメーション**: ASCII artキャラクターがターミナル上で動き回る
- 💬 **インタラクティブなメッセージ**: キャラクターが状況に応じてコメントを表示
- 📊 **プロセス監視**: 他のプロセスの動作状況を監視して反応を変更
- 🎨 **カスタマイズ可能**: キャラクター、アニメーション、メッセージをカスタマイズ
- 🖥️ **クロスプラットフォーム**: Windows Terminal、iTerm2、tmux等で動作
- ⚡ **高パフォーマンス**: 軽量で効率的なアニメーション

## 使用例

```bash
# AIモデルの訓練中に実行
$ ccanim --watch "python train_model.py"

# 既存のプロセスを監視
$ ccanim --pid 1234

# 特定のログファイルを監視
$ ccanim --log "./training.log"

# シンプルにキャラクターを表示
$ ccanim --idle
```

## 技術スタック

- **Language**: Go
- **主要ライブラリ**: 
  - [Bubble Tea](https://github.com/charmbracelet/bubbletea) (TUIフレームワーク)
  - [Lip Gloss](https://github.com/charmbracelet/lipgloss) (スタイリング)
  - [Bubbles](https://github.com/charmbracelet/bubbles) (UIコンポーネント)

## 開発ロードマップ

### Phase 1: 基礎実装
- [x] プロジェクト初期化
- [ ] 基本的なBubble Teaアプリケーション構造
- [ ] シンプルなキャラクター表示
- [ ] 基本的なアニメーションシステム

### Phase 2: アニメーション強化
- [ ] 複数アニメーションパターン
- [ ] Lip Glossによるスタイリング
- [ ] メッセージ表示システム
- [ ] 設定ファイル対応

### Phase 3: プロセス監視
- [ ] プロセス監視機能
- [ ] 標準出力監視
- [ ] 状態連動アニメーション
- [ ] バックグラウンド処理

### Phase 4: 高度な機能
- [ ] 複数キャラクター対応
- [ ] プラグインシステム
- [ ] パフォーマンス最適化
- [ ] コミュニティキャラクター

## インストール

```bash
# バイナリをダウンロード（リリース後）
curl -sSL https://github.com/ktny/ccanim/releases/latest/download/ccanim_linux_amd64.tar.gz | tar xz

# Goを使って直接インストール
go install github.com/ktny/ccanim@latest
```

## 開発環境セットアップ

```bash
git clone https://github.com/ktny/ccanim.git
cd ccanim
go mod tidy
go run .
```

## アーキテクチャ

```
┌─────────────────┐
│   Main Program  │
├─────────────────┤
│ • CLI Parsing   │
│ • Config Load   │
└─────────────────┘
         │
    ┌────┴────┐
    │         │
┌───▼───┐ ┌──▼──────┐
│Monitor│ │Character│
│Model  │ │Model    │
└───┬───┘ └──┬──────┘
    │        │
┌───▼───┐ ┌──▼──────┐
│Process│ │Animation│
│Watcher│ │Engine   │
└───────┘ └─────────┘
```

## ライセンス

MIT License

## 貢献

プルリクエストやIssueの投稿を歓迎します！

---

**注意**: このプロジェクトは開発中です。機能や仕様は変更される可能性があります。