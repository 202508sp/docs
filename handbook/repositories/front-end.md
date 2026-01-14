# front-end

リポジトリ: https://github.com/202508sp/front-end

## 概要
システムのフロント部分（ダッシュボード/電子カルテ）です。

## セットアップ（package.json から）

### インストール
```bash
npm install
```

### 開発
```bash
npm run dev
```

### ビルド/プレビュー
```bash
npm run build
npm run preview
```

### Lint / Test
```bash
npm run lint
npm run test
```

## 技術スタック

- SvelteKit 2.16
- TypeScript
- Bun
- MasterCSS
- Vite / ESLint / Prettier

## 機能
- ネスト深度を最大2階層に制限して操作単純化
- ダッシュボードのドラッグ&ドロップ配置
- お気に入り機能
- アイコン収納による省スペース化
- 統合データからの日次レポート生成
