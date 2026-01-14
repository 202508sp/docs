# eye-tracking

リポジトリ: https://github.com/202508sp/eye-tracking

## 概要
ESP-EYE からの映像を OpenCV 経由で解析し、視線コマンドに変換する C++ プロジェクトです。

瞬き（EAR法）と視線方向推定でコマンドを実行し、二重瞬きで操作モードのON/OFFを切り替える想定です。

## 設定ファイル
- `config/config.xml`（しきい値など）
- `data/calibration/user_calibration.xml`
- `data/cascades/haarcascade_eye.xml`
- `data/cascades/haacascade_frontalface_alt.xml`
- `data/models`

## ビルド環境
- CMake
- ucrt64（MSYS2）
- OpenCV
- Ninja

### ビルド例（msys64）
```cmd
cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release ..
ninja
```

## 仕様メモ
- 瞬き検出: EAR法、閾値 0.25
- 2回連続の瞬きで操作モード ON/OFF
- ON時は視線方向の閾値超えで該当コマンド実行
- 処理モジュール例: EyeTracker / BlinkDetector / GazeEstimator / CommandController / WindowsController
