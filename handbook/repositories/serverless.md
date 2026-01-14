# serverless

リポジトリ: https://github.com/202508sp/serverless

## 概要
AWS 関連のインフラ／API をまとめたリポジトリです。
ローカル開発では `serverless-offline` を使って API を立ち上げ、他リポジトリ（例: `speech-to-text`）から HTTP で呼び出します。

デバイスIDをDynamoDBで検証し、登録済みデバイスのみ受け付けること、またローカルLLM（例: Ollama gemma3:1b）で自然言語をコマンドに変換する想定です。

## 主要機能

### コマンド受付 API
- エンドポイント（serverless.yml）: `POST /command`
- ハンドラ: `functions/commandHandler.ts` の `handler`
- リクエスト: `{ audio, deviceId }`
  - `speech-to-text` のローカル実装では `audio` に「音声認識の文字列」を入れています（本来は音声データ想定の可能性あり）
- 処理フロー（概略）
  1. deviceId でデバイスの登録チェック（DynamoDB）
  2. speech service で文字起こし
  3. AI service でコマンド解析
  4. コマンドを実行し、結果（`displayText` など）を返す

### 実装されているコマンド
`functions/commands/index.ts` より
- `GET_PATIENT_INFO`
- `RECORD_VITAL`
- `RECORD_MEAL`
- `RECORD_MEDICINE`
- `CALL_STAFF`
- `EMERGENCY`

## 主要ファイル
- `functions/commandHandler.ts`: 入口
- `functions/commands/*`: コマンド実体
- `functions/services/*`: AI/音声/データサービス（モック含む）

## セットアップ（ローカル）

### 前提
- Node.js
- Serverless Framework

### インストール
```bash
npm install
```

### 起動（ローカル）
```bash
npm run start
```

起動すると、ステージ `dev` の offline が `http://localhost:3000` で立ち上がる想定です。

## 環境変数と資格情報
`serverless.yml` では `useDotenv: true` になっています。
また `google-credentials.json` をパッケージに含める指定があり、取り扱いに注意が必要です（コミットしない/配布しない）。

## `speech-to-text` との連携
`speech-to-text` は `POST http://localhost:3000/dev/command/` に転送しています。
- `serverless` 側のルーティングが `POST /command` のため、末尾スラッシュや stage 名を含めたパスは合わせる必要があります。

## 動かすときの注意
- DynamoDB のテーブル名（環境変数）が未設定だと 403/500 系になりやすい
- `audio` が「音声 base64」想定なのか「文字列」想定なのかは、`speech-to-text` 側と合わせて整理します
