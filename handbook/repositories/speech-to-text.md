# speech-to-text

リポジトリ: https://github.com/202508sp/speech-to-text

## 概要
ブラウザの音声認識（Web Speech API）で発話をテキスト化し、SvelteKit の API ルート経由で `serverless` に転送するためのフロントです。

フロントエンドは SvelteKit + TypeScript + Bun + MasterCSS を想定し、連続音声認識→3秒無音で送信、という流れです。

## 主な機能

### 音声認識→トリガー→送信
- `src/routes/+page.svelte`
- 音声認識は `window.SpeechRecognition || window.webkitSpeechRecognition`
- キーワード「トリガー」を含む確定結果を検出すると収集モードに入る
- 収集モード中は 3 秒無音で「収集したテキスト」を `sendToServer()` で送信

### API ルート（転送）
- `src/routes/api/voice/+server.ts`
- `POST /api/voice` を受ける
- 外部へ転送: `POST http://localhost:3000/dev/command/`
  - body: `{ audio: text, deviceId: "mock_01" }`
- 返ってきた `{ command, displayText }` を整形してフロントへ返却

## セットアップ

### 前提
- Node.js

### インストール
```bash
npm install
```

### 起動
```bash
npm run dev
```

## 連携
- 依存先: `serverless`（ローカルは `serverless-offline`）
- 接続先 URL は `+server.ts` に直書きされているため、チーム運用では環境変数化が推奨です

## 動かすときの注意
- Web Speech API はブラウザ依存（Chrome 系の方が動きやすい）
- マイク許可が必要
- `serverless` が起動していないと `502` になります
