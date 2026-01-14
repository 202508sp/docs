# docs

リポジトリ: https://github.com/202508sp/docs

## 概要
`docs` は、組織のドキュメント（文章・仕様・運用）を集約するリポジトリです。

## 主な内容
- 本文（handbook）: 組織の「わたり方」
- textlint 設定: 日本語技術文書向けのルールセット

## セットアップ

### 前提
- Node.js / Bun が使える環境

### コマンド
- lint: `bun run lint`
- lint（自動修正）: `bun run lint:fix`

> `lint` は `README.md` と `handbook/**/*.md` を対象にしています（`.textlintrc.handbook`）。

## 運用ルール
- 入口: `handbook/README.md`
- リポジトリ単位の詳細: `handbook/repositories/*.md`
- 追加で設計資料が増える場合は、`handbook/` 配下でカテゴリ分けして増やす
