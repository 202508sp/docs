# firmware

リポジトリ: https://github.com/202508sp/firmware

## 概要
M5Stack Core2 + M5Unit GLASS2 に、BLE 経由で受け取ったテキストを表示するファームウェアです。

表示デバイスとして透過OLED（M5UnitGLASS2、128×128px）を採用し、ミラーで反射して視野内に投影する構成です。

## 主な機能

### BLE サービス
- デバイス名: `Core2Glass`
- Service UUID: `5b27f7a0-4c52-4c80-ae0b-8b3e8c1e0001`
- Characteristic UUID（テキスト）: `5b27f7a0-4c52-4c80-ae0b-8b3e8c1e0002`

### テキスト描画
- characteristic に write されると `view.text` を更新
- `\n` を改行として行分割し、GLASS2 に描画

## セットアップ（書き込み）

### 前提
- Arduino IDE（または PlatformIO）
- M5Stack Core2 のボード設定
- ライブラリ
  - `M5Unified`
  - `M5UnitGLASS2`
  - ESP32 BLE 系（`BLEDevice.h` など）

### 書き込み対象
- `main.ino`

## 動作確認
- BLE 接続されると LCD に `BLE Connected` / `BLE Advertising` が表示されます
- `glass2-front` からテキスト送信すると GLASS2 の表示が更新されます

## 動かすときの注意
- BLE ライブラリの依存（ESP32 のコアバージョン）でビルドが壊れることがあります
- GLASS2 側のフォントや行送りは表示崩れの原因になりやすいです
