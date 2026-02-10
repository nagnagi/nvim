# Neovim Configuration - Development Hub

Neovimを開発の拠点にするための統合設定です。プロジェクト管理、TODO管理、エディタ機能を一元化します。

## 🎯 主要機能

- **プロジェクト管理** - project.nvim による自動ルート検出と切り替え
- **TODO管理** - todo-comments.nvim でコード内のTODO/BUGを一元管理
- **ファイル操作** - neo-tree でファイルツリーを管理
- **検索** - Telescope による高速ファイル検索
- **ターミナル統合** - toggleterm による複数ターミナル
- **タスク実行** - overseer によるビルド・実行管理

---

## 📋 キーバインド一覧

### Find / Fuzzy Search (`<leader>f`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>ff` | Find files | ファイル検索 |
| `<leader>fg` | Live grep | テキスト検索 |
| `<leader>fb` | Buffers | バッファ一覧 |
| `<leader>fh` | Help tags | ヘルプ検索 |
| `<leader>fp` | Projects | プロジェクト一覧 ✨ |

### Search / Snap Todo (`<leader>s`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>sf` | Find todos | TODO検索 (Telescope) ✨ |
| `<leader>st` | Show todos | TODO表示 (Trouble) ✨ |
| `<leader>sn` | Snap next todo | 次のTODOへジャンプ ✨ |
| `<leader>sp` | Snap prev todo | 前のTODOへジャンプ ✨ |

### Explorer / File Tree (`<leader>e`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>ee` | Reveal focus | ファイルツリーで現在ファイルを表示 |
| `<leader>ef` | Float | 浮動ファイルツリー |
| `<leader>et` | Toggle | ファイルツリーの表示/非表示 |
| `<leader>eh` | Left side | 左側パネルに表示 |
| `<leader>ed` | Symbols | ドキュメントシンボル表示 |
| `<leader>eb` | Buffers | バッファツリー表示 |
| `<leader>es` | Show | ファイルツリー表示 |

### Buffer (`<leader>b`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>bx` | Pick close | バッファを選択して閉じる |
| `<leader>bX` | Close others | 他のバッファをすべて閉じる |
| `<leader>bs` | Sort by directory | ディレクトリ順にソート |

### Aerial - Symbols (`<leader>a`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>ao` | Open | シンボルツリーを開く |
| `<leader>at` | Toggle | シンボルツリーの表示/非表示 |
| `<leader>ad` | Go to symbol | シンボルへジャンプ |
| `<leader>ae` | Toggle with neo-tree | ツリーとシンボルを同時表示 |

### Terminal (`<leader>t`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>tt` | Float | 浮動ターミナル |
| `<leader>tv` | Vertical | 垂直分割ターミナル |
| `<leader>th` | Horizontal | 水平分割ターミナル |
| `<leader>tn` | Tab | タブターミナル |
| `<leader>tf` | Float (4) | 浮動ターミナル (別) |

### Run / Task (`<leader>r`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>rr` | Run task | タスク実行 (overseer) |
| `<leader>rt` | Toggle | タスク表示切り替え |

### Memo / Telekasten (`<leader>m`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>mm` | Panel | メモパネル表示 |
| `<leader>mf` | Find notes | ノート検索 |
| `<leader>mg` | Search notes | ノート内検索 |
| `<leader>md` | Go to today | 今日のノートへ |
| `<leader>mz` | Follow link | リンクをたどる |
| `<leader>mn` | New note | 新しいノート作成 |
| `<leader>mc` | Show calendar | カレンダー表示 |
| `<leader>mb` | Show backlinks | バックリンク表示 |
| `<leader>mI` | Insert image link | 画像リンク挿入 |
| `<leader>ml` | Insert link | リンク挿入 (Insert mode) |

### Orgmode (`<leader>o`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>oa` | Org agenda | Org agenda 表示 |
| `<leader>oc` | Org capture | Org capture 実行 |

### Vibe - AI (`<leader>v`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>vm` | Mistral | Mistral CLI |
| `<leader>vg` | Gemini | Gemini CLI |
| `<leader>vc` | Copilot CLI | Copilot CLI |

### Preview (`<leader>p`)

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>pm` | Markdown | Markdown プレビュー切り替え |

### Zen Mode

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>z` | Zen mode | ゼンモード (集中モード) |

### LSP

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>k` | Hover | LSP ホバー情報表示 |

### Standalone

| キー | コマンド | 説明 |
|------|---------|------|
| `<leader>lg` | LazyGit | Git UI (LazyGit) |

---

## 🚀 ワークフロー例

### シナリオ1: 新規プロジェクトで作業開始

```
1. nvim
2. <leader>fp                  ← プロジェクト一覧表示
3. Enter                       ← プロジェクト選択
4. <leader>ff                  ← ファイル検索
5. ファイル選択               ← 編集開始
```

### シナリオ2: TODOを追跡しながら開発

```
1. コード内に -- TODO: 機能を書く
2. <leader>st                  ← TODOパネル表示（左側）
3. <leader>sn                  ← 次のTODOへジャンプ
4. 編集                        ← コード修正
5. <leader>sf                  ← TODOを検索表示
```

### シナリオ3: プロジェクト内ファイルを操作

```
1. <leader>et                  ← ファイルツリー表示
2. 矢印キーで移動             ← ファイル選択
3. Enter                       ← ファイルを開く
4. <leader>ed                  ← シンボル表示
5. <leader>ad                  ← シンボルへジャンプ
```

### シナリオ4: ビルド＆テスト実行

```
1. <leader>rr                  ← タスク実行メニュー
2. コマンド選択               ← ビルドコマンド実行
3. <leader>rt                  ← 結果を表示/非表示
```

### シナリオ5: Git 操作

```
1. <leader>lg                  ← LazyGit 起動
2. git 操作（Stage, Commit等）
3. q                          ← LazyGit 終了
```

---

## 🎨 which-key の使い方

```
Neovimで:

<leader>?                      ← which-key を表示
                                 ↓
                              グループ一覧が表示
                                 ↓
                              <leader>f で "find" グループ展開
                              <leader>s で "search/snap" グループ展開
```

---

## 📦 プラグイン一覧

| プラグイン | 機能 | キー |
|-----------|------|------|
| project.nvim | プロジェクト管理 | `<leader>fp` |
| todo-comments.nvim | TODO管理 | `<leader>sf`, `sn`, `sp` |
| neo-tree.nvim | ファイルツリー | `<leader>e*` |
| telescope.nvim | ファイル検索 | `<leader>f*` |
| trouble.nvim | リスト表示 | `<leader>st` |
| toggleterm.nvim | ターミナル | `<leader>t*` |
| overseer.nvim | タスク実行 | `<leader>r*` |
| telekasten.nvim | メモ管理 | `<leader>m*` |
| orgmode.nvim | Org mode | `<leader>o*` |
| aerial.nvim | シンボルツリー | `<leader>a*` |
| which-key.nvim | キーバインド表示 | `<leader>?` |

---

## 💡 Tips

- **which-key で迷わない:** `<leader>?` を頻繁に使う
- **TODO検索:** `<leader>sf` で全TODOを検索し、フィルタリング可能
- **快速ナビゲーション:** `<leader>et` + `<leader>ed` で構造を把握
- **ターミナル:** `<leader>tt` で浮動ターミナルを素早く起動
- **集中モード:** `<leader>z` で邪魔なものを非表示

---

## 🔧 カスタマイズ

各設定ファイルは `lua/plugins/` 以下に配置されています：

```
lua/plugins/
├── project.lua              # プロジェクト管理
├── todo-comments.lua        # TODO管理
├── which-key.lua            # キーバインド（このファイル）
├── neo-tree.lua             # ファイルツリー
├── telescope.lua            # ファイル検索
├── overseer.lua             # タスク実行
└── ... (他のプラグイン)
```

各ファイルを編集してカスタマイズできます。

---

## 📝 最後に

このセットアップにより、Neovim が **IDE のような開発ハブ** になります：

✅ プロジェクト管理 - 複数プロジェクトを素早く切り替え
✅ TODO管理 - コード内のタスクを一元管理
✅ ファイル操作 - ツリービューで視覚的に操作
✅ 検索・ナビゲーション - 高速な移動と検索
✅ ターミナル統合 - ビルド・テスト・Git操作

**Happy coding! 🚀**
