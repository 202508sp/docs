# glass2-front

リポジトリ: https://github.com/202508sp/glass2-front

## 概要
M5Stack Core2（firmware 側で BLE 名 `Core2Glass`）へ、ブラウザ（Web Bluetooth）からテキストを送るための SvelteKit アプリです。
テキストをスロットに保存し、一定間隔で順番に送信する UI を持っています。

## 主な機能

### BLE 接続
- `src/lib/index.ts`
  - `SERVICE_UUID = 5b27...0001`
  - `CHAR_TEXT_UUID = 5b27...0002`
  - `navigator.bluetooth.requestDevice({ filters: [{ name: 'Core2Glass' }], optionalServices: [SERVICE_UUID] })`

### テキスト送信
- `src/lib/index.ts` の `writeText()` が characteristic に `writeValue()`
- `src/routes/+page.svelte`
  - スロット（テキスト＋ディレイ）を編集
  - 単発送信
  - スロットを順番再生（setTimeout でループ）

## セットアップ

### 前提
- Node.js
- Web Bluetooth 対応ブラウザ（Chromium 系推奨）

### インストール
```bash
npm install
```

### 起動
```bash
npm run dev
```

## 動作確認手順
1. `firmware` を Core2 に書き込み、BLE が Advertising している状態にする
2. `glass2-front` を HTTPS か localhost で開く（Web Bluetooth の要件）
3. 画面の「BLE 接続」→ `Core2Glass` を選択
4. スロットを編集して送信（Core2 側で表示が更新される）

## 動かすときの注意
- Web Bluetooth は HTTPS / localhost が必要
- OS/ブラウザ/権限によってはデバイスが見つからない
- 送信する文字列が長い場合は分割送信が必要になることがあります
